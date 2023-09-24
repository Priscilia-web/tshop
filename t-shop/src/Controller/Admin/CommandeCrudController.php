<?php

namespace App\Controller\Admin;

use App\Entity\Commande;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ChoiceField;
use EasyCorp\Bundle\EasyAdminBundle\Field\NumberField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IntegerField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class CommandeCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Commande::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id')->hideOnForm(),
            IntegerField::new('quantite'),
            NumberField::new('montant'),
            ChoiceField::new('etat')->setChoices(['en cours de traitement'=>'en cours de traitement', 'envoyé'=>'envoyé', 'livré'=>"livré"]),
            DateTimeField::new('date_enregistrement')->setFormat('d/M/Y à H:m:s')->hideOnForm(),
            AssociationField::new('membre')->renderAsNativeWidget(),
            AssociationField::new('produits')->renderAsNativeWidget(),
            
            
        ];
        
    }
}
