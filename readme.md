# C-app Developed by Laravel 5.4 & JQuery

A [Laravel](http://laravel.com/) and [JQuery](https://jquery.com/) application for trading management.

- This application is for trading services crypto-mining. 
- Each user can have an account after submission and the services is activated after payment of the submission fees. The user can make submission directly or throught an existing user using a link of affiliation. If so, the new user enter in the network of the affiliate user as a sub-network (There is a tree in the application in the network section to understand the concept when running the live action). After the submission the user can buy a trading pack to begin earning money and he can save all his banks accounts and wallets (bitcoin, ethereum, ...). Every user has a balance and he can request withdral from it, and when it is accepted, the money is sent to his bank or wallet accounts. If he has any questions or problems, he can open a ticket and submit it to the administrators of the platform. Of course he can manage his profil. Finally, he can see all the posts published bu the administrators.
- In the back-office (Administration), the administrator has severals modules for management the platform. Also, he can validate or reject the withrawals requests from the users. A users management is set in this space, also, to publish posts a posts management is set for this purpose, Tha administrator can manage the balance users and he can manage the company banks and wallets accounts. Plus, the administrator can manage the subscriptions in the platform and the pack bought. Finally, he can manage the tickets opened by users.
- All the code is written by me.

## Installation

- composer install
- Create database and fill the database name and username and password database in the .env file
- php artisan migrate --seed or php artisan migrate:refresh **(if you have already the database with it tables). You will find a sample data generated automatically by the seed files**
- php artisan serve
- Use the [http://localhost:8000](http://localhost:8000) in the browser to view the application

## Live Demo

Here is the link for Live demo [Live Demo](http://elmabroukmarouane.pw/c-app/)

- Account :
  Super Administrator :
  Email : [super_admin@mail.com](super_admin@mail.com)
  Password : 123456

User :
Email : [user@mail.com](user@mail.com)
Password : 123456

## Contact :

EL MABROUK Marouane : [elmabroukmarouane@gmail.com](elmabroukmarouane@gmail.com)
