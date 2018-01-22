# Find-A-Pet 2.0

Find-A-Pet built entirely with Ruby on Rails, utilizing Paperclip and AWS SDK gems for image upload.

# User Stories
User loads Index page, can either click on Pets button to view available pets, Login to sign in if they have an account, or Register to create a new account.  

If the user clicks on Pets, it will render a list of all the posts made on the page.  Each post is represented by the Pet's name, and when you click the name it will then show you more information about that pet.

If the user clicks on Register they can create an account.  Once account is created they will be signed in and redirected to User Profile page.

If the user clicks Login they can enter their credentials, and they will then be redirected to the User Profile page.

The User Profile page will have buttons where the user can edit their profile and to create new posts.  Beneath that a list of the posts that user has created, if any.  

If the user clicks on Edit Profile, they can Edit all the information for their profile, as well as delete their account.

If the user clicks on a post they made, it will show the posts content, as well as offer buttons to edit or delete the post.

# Tech Used
Ruby on Rails

AWS SDK 2.3 Gem
Figaro Gem
Paperclip Gem
Tzinfo-data Gem

Deployed on Heroku:  findapetv2.herokuapp.com