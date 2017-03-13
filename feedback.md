# Project 2 Evaluation

## Technical Requirements
**2: Performing**
>The app contains 2 models, with at least 1 association. At least 1 model is full CRUD.

## Creativity and Interface
**2: Performing**
>The app displays a personal spin or creative element through its written language, functionality, purpose, and/or CSS. Submission includes proof of HTML / CSS validation

## Code Quality
**2: Performing**
>Code is well-formatted, well-named, and contains few style / quality issues

## Deployment and Functionality
**2: Performing**
>Application contains no major errors, is deployed correctly, and contains a custom Heroku app name appropriate for the app.

## Planning / Process / Submission
**2: Performing**
>Submission contains clear evidence of planning, adequate documentation, include all from previous category, as well as additional information such as unsolved issues.

## Code Comments

```diff
diff --git a/app/assets/stylesheets/application.css b/app/assets/stylesheets/application.css
index 2d585da..5b987d2 100644
--- a/app/assets/stylesheets/application.css
+++ b/app/assets/stylesheets/application.css
@@ -16,6 +16,7 @@ body {
 .container{
   display: flex;
 }
+/*Good application of flexbox for responsive layout*/

 #login {
   display: inline-block;
diff --git a/app/controllers/application_controller.rb b/app/controllers/application_controller.rb
index 66383fe..a6edacf 100644
--- a/app/controllers/application_controller.rb
+++ b/app/controllers/application_controller.rb
@@ -2,6 +2,7 @@ class ApplicationController < ActionController::Base
   before_action :authenticate_user!, :set_totals
   protect_from_forgery with: :exception

+  # Awesome application of before_action to sum up the accounts and authenticate user
   def set_totals
     @total_expenses= Expense.all.map { |expense| expense.value }.sum
     # @total_expenses= number_to_currency(@total_expenses)
diff --git a/app/controllers/assets_controller.rb b/app/controllers/assets_controller.rb
index 3b96ca0..38210ce 100644
--- a/app/controllers/assets_controller.rb
+++ b/app/controllers/assets_controller.rb
@@ -39,6 +39,7 @@ class AssetsController < ApplicationController

   private
   def asset_params
-    params.require(:asset).permit(:id, :category, :value)
+    params.require(:asset).permit(:category, :value)
+    # You don't need to list :id on .permit. It only limits what can come in as form data.
   end
 end
diff --git a/app/controllers/dashboard_controller.rb b/app/controllers/dashboard_controller.rb
index 740fddf..4a8997e 100644
--- a/app/controllers/dashboard_controller.rb
+++ b/app/controllers/dashboard_controller.rb
@@ -9,6 +9,9 @@ class DashboardController < ApplicationController
     @asset = Asset.new
     @expense = Expense.new
   end
+  # I don't think new is being used here. The links to add new assets and expenses
+  # from the main dashboard view go to expenses#new and assets#new. If unused, you
+  # can delete it. Same with create.

   def create
     @asset = Asset.new(asset_params.merge(user: current_user))
diff --git a/app/controllers/expenses_controller.rb b/app/controllers/expenses_controller.rb
index 4a2f1f1..ff39e34 100644
--- a/app/controllers/expenses_controller.rb
+++ b/app/controllers/expenses_controller.rb
@@ -2,6 +2,11 @@ class ExpensesController < ApplicationController

   def index
     @expenses = Expense.all
+    # This current code will show every user the same expenses and assets. If you
+    # wanted to show each user accounts specific to them, you would have to query
+    # for associations based on current_user. Same for the other controller actions.
+    #
+    # @expenses = current_user.expenses
   end

   def show
@@ -40,7 +45,7 @@ class ExpensesController < ApplicationController

   private
   def expense_params
-    params.require(:expense).permit(:id, :category, :value)
+    params.require(:expense).permit(:category, :value)
   end

 end
diff --git a/app/views/dashboard/index.html.erb b/app/views/dashboard/index.html.erb
index 0b32c5f..13854d3 100644
--- a/app/views/dashboard/index.html.erb
+++ b/app/views/dashboard/index.html.erb
@@ -3,6 +3,9 @@
       <% @assets.each do |asset| %>
         <li>
           <%= link_to asset.category, asset %>
+          <%# While rails will adapt it for you typically, it is better to more
+          specifically define the path that link_to uses. Example:
+          link_to asset.category, asset_path(asset) %>
           <%= number_to_currency(asset.value) %>
         </li>
       <% end %>
diff --git a/app/views/layouts/application.html.erb b/app/views/layouts/application.html.erb
index 200b816..c94ec77 100644
--- a/app/views/layouts/application.html.erb
+++ b/app/views/layouts/application.html.erb
@@ -7,7 +7,7 @@
     <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track': 'reload' %>
     <%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>
     <%= favicon_link_tag 'http://i.imgur.com/9LMGF81.png' %>
-
+    <%# Nice touch using a favicon %>
   </head>

   <body>
@@ -31,6 +31,7 @@
                 <%= link_to "Sign out", destroy_user_session_path, :method => :delete %>
               <% end %>
             </li>
+            <%# Really well formatted and dynamic navigation menu %>
           </ul>
         </div>
       </div>
@@ -38,6 +39,8 @@
       <div id="balance">
       <!-- Total Assets <%= number_to_currency(@total_assets) %>
       Total Expenses <%= number_to_currency(@total_expenses) %> -->
+      <%# Be careful commenting out ERB like above, it can cause errors. The best way
+      to comment out ERB code is like this. %>
       <h2>Balance <%= number_to_currency(@net_total) %>
     </h2>
       <% end %>
diff --git a/config/routes.rb b/config/routes.rb
index 4de93d8..376f440 100644
--- a/config/routes.rb
+++ b/config/routes.rb
@@ -1,6 +1,7 @@
 Rails.application.routes.draw do
 root to: "dashboard#index"
-
+# Good use here of root and custom routes. Only question is why the app
+# needs both /home and /dashboard to route to dashboard#index?
 get '/dashboard', to: 'dashboard#index'
 get '/home', to: 'dashboard#index'
 get '/assets', to: 'assets#index'
@@ -11,6 +12,7 @@ get '/expenses', to: 'expenses#index'
   resources :expenses
 end

+
 # Prefix Verb   URI Pattern                    Controller#Action
 # new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
 #  user_session POST   /users/sign_in(.:format)       devise/sessions#create
diff --git a/db/migrate/20170227143323_devise_create_users.rb b/db/migrate/20170227143323_devise_create_users.rb
index f577233..9137cff 100644
--- a/db/migrate/20170227143323_devise_create_users.rb
+++ b/db/migrate/20170227143323_devise_create_users.rb
@@ -1,4 +1,5 @@
 class DeviseCreateUsers < ActiveRecord::Migration[5.0]
+  # Nice use of devise for setting up your users
   def change
     create_table :users do |t|
       ## Database authenticatable
diff --git a/db/migrate/20170227170517_create_assets.rb b/db/migrate/20170227170517_create_assets.rb
index 13c0d33..c92b0ec 100644
--- a/db/migrate/20170227170517_create_assets.rb
+++ b/db/migrate/20170227170517_create_assets.rb
@@ -2,6 +2,7 @@ class CreateAssets < ActiveRecord::Migration[5.0]
   def change
     create_table :assets do |t|
       t.string :category
+      # Good use of the decimal rails data type
       t.decimal :value, :precision =>15, :scale => 2
       t.references :user
       t.timestamps
```
