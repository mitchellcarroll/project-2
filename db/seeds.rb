User.destroy_all
Asset.destroy_all
Expense.destroy_all

peter = User.create!({email: "peter@gmail.com", password: "password"})

peterAssets = Asset.create!({user: peter, category: "income", value: 5000})

peterExpenses = Expense.create!({user: peter, category: "housing", value: 3000})
