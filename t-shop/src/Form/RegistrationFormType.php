<?php

namespace App\Form;

use App\Entity\Membre;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Validator\Constraints\IsTrue;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;

class RegistrationFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
        ->add('pseudo')
        // ->add('roles')
        ->add('plainPassword', RepeatedType::class, [
            // instead of being set onto the object directly,
            // this is read and encoded in the controller
            'type'=> PasswordType::class,
            'first_options' => ['label' => 'mot de passe'],
            'second_options' => ['label' => 'confirmer mot de passe'],
            'invalid_message' => 'les mots de passes ne correspondent pas',
            'mapped' => false,
            'attr' => ['autocomplete' => 'new-password'],
            'constraints' => [
                new NotBlank([
                    'message' => 'Please enter a password',
                ]),
                new Length([
                    'min' => 6,
                    'minMessage' => 'Your password should be at least {{ limit }} characters',
                    // max length allowed by Symfony for security reasons
                    'max' => 4096,
                ]),
            ],
        ])
        ->add('nom')
        ->add('prenom')
        ->add('email')
        // ->add('date_enregistrement')
        ->add('civilite', ChoiceType::class, [
            'choices' => [
                'Homme' => 'homme',
                'Femme' => 'femme',
                'Autres' => 'other'
            ]
        ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Membre::class,
        ]);
    }
}
