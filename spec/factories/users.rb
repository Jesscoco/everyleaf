FactoryBot.define do
  factory :user do
    name { "MyString" }
    email { "usertest@gmail.com" }
    password { "MyUserString" }

  end
  factory :admin,  class: User do
    name { "MyString" }
    email { "admintest@gmail.com" }
    password { "MyAdminString" }
    is_admin{true}
  end
end
