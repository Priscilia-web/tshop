<?php

namespace App\Controller;

use App\Entity\Membre;
use App\Form\RegistrationFormType;
use App\Repository\ProduitRepository;
use App\Service\CartService;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Security\Http\Attribute\IsGranted;


class AppController extends AbstractController
{
    #[Route('/', name: 'app_app')]
    public function index( ProduitRepository $repo, CartService $cs): Response
    {
        $produits = $repo->findAll();
        $cart = $cs->cart();
        return $this->render('app/index.html.twig', [
            'produits'=> $produits,
            'cart' => $cart
        ]);
    }

    #[Route('/compte/commandes', name:"app_compte")]
    public function compteCommande()
    {
        return $this->render('app/account.html.twig');
    }
}
