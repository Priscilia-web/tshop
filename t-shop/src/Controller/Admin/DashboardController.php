<?php

namespace App\Controller\Admin;

use App\Entity\Membre;
use App\Entity\Produit;
use App\Entity\Commande;
use Symfony\Component\HttpFoundation\Response;
use App\Controller\Admin\ProduitCrudController;
use Symfony\Component\Routing\Annotation\Route;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Router\AdminUrlGenerator;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;

class DashboardController extends AbstractDashboardController
{
    public function __construct(private AdminUrlGenerator $adminUrlGenerator)
    {
    }

    #[Route('/admin', name: 'admin')]
    public function index(): Response
    {
        // return parent::index();
        $url = $this->adminUrlGenerator->setController(ProduitCrudController::class)->generateUrl();
        return $this->redirect($url);
        
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('T Shop');
    }

    public function configureMenuItems(): iterable
    {
        return [
            MenuItem::linkToDashboard('Accueil', 'fa fa-home'),
            MenuItem::section("Produit"),
            MenuItem::linkToCrud('Produit', 'fas fa-clipboard', Produit::class),
            MenuItem::section('Membres'),
           MenuItem::linkToCrud('utilisateurs', 'fas fa-user', Membre::class),
           MenuItem::section('Commandes'),
           MenuItem::linkToCrud('commandes', 'fas fa-box', Commande::class),
           MenuItem::section('Sites général'),
           MenuItem::linkToRoute('Home','fa fa-home','app_app' )

       ];
    }
}
