<?php

namespace App\Controller;

use App\Entity\Membre;
use App\Form\RegistrationFormType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Contracts\Translation\TranslatorInterface;

class RegistrationController extends AbstractController
{
    #[Route('/inscription/afficher', name: 'inscription_afficher')]
    public function afficherFormulaire(Request $request, UserPasswordHasherInterface $userPasswordHasher, EntityManagerInterface $entityManager): Response
    {
        $user = new Membre();
        $form = $this->createForm(RegistrationFormType::class, $user);
        $form->handleRequest($request);
        // dd($user);

        return $this->render('registration/register.html.twig', [
            'registrationForm' => $form->createView(),
        ]);
    }

    #[Route('/inscription/traiter', name: 'inscription_traiter', methods: 'POST')]
    public function traiterFormulaire(Request $request, UserPasswordHasherInterface $userPasswordHasher, EntityManagerInterface $entityManager): Response
    {
        $user = new Membre();
        $form = $this->createForm(RegistrationFormType::class, $user);
        $form->handleRequest($request);
        // dd($user);
        if ($form->isSubmitted() && $form->isValid()) {
            // encode the plain password
            $user->setPassword(
                $userPasswordHasher->hashPassword(
                    $user,
                    $form->get('plainPassword')->getData()
                )
            )
                ->setDateEnregistrement(new \Datetime);
                    
            $entityManager->persist($user);
            $entityManager->flush();
            // do anything else you need here, like send an email

            return $this->redirectToRoute('app_app');
        }

        return $this->render('registration/register_traitement.html.twig', [
            'registrationForm' => $form->createView(),
        ]);
    }
}
