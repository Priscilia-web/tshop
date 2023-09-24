<?php

namespace App\Controller\Admin;

use App\Entity\Produit;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ChoiceField;
use EasyCorp\Bundle\EasyAdminBundle\Field\NumberField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IntegerField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class ProduitCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Produit::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id')->hideOnForm(),
            TextField::new('titre'),
            TextEditorField::new('description')->onlyOnForms(),
            DateTimeField::new('date_enregistrement')->setFormat('d/M/Y à H:m:s')->hideOnForm(),
            ChoiceField::new('couleur')->setChoices(['rouge'=>"rouge", "bleu"=>"bleu", "blanc"=>"blanc", "jaune"=>"jaune"]),
            ChoiceField::new('taille')->setChoices(['S'=> "S", "M"=>"M", "L" => "L", "XL"=>"XL"]),
            ChoiceField::new('collection')->setChoices(['H'=>'homme', "F"=>"femme", "E" => "enfant"]),
            ImageField::new('photo')->setUploadDir('public/uploads/images/')->setUploadedFileNamePattern('[timestamp]-[slug]-[contenthash].[extension]')->onlyWhenUpdating()->setFormTypeOptions([
                'required' => false, // Rendre le champ non requis lors de la mise à jour
            ]),
            ImageField::new('photo')->setUploadDir('public/uploads/images/')->setUploadedFileNamePattern('[timestamp]-[slug]-[contenthash].[extension]')->onlyWhenCreating(),
            ImageField::new('photo')->setBasePath('uploads/images/')->hideOnForm(),
            MoneyField::new('prix')->setCurrency('EUR')->setNumDecimals(2),
            IntegerField::new('stock')
            
        ];
    }
    public function createEntity(string $entityFqcn)
    {
        $produit =new $entityFqcn;
        $produit->setDateEnregistrement(new \DateTime);
        return $produit;
    }
}
