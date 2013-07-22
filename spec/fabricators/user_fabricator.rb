Fabricator(:user) do
  name 'Bruce Wayne'
  email { sequence(:email) { |i| "bruce#{i}@wayne.com" } }
  passcode 'myawesomepassword'
end

