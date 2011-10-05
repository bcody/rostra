Factory.define :user do |f|
  f.sequence(:email) { |n| "foo#{n}@example.com" }
  f.password "password"
  f.password_confirmation { |u| u.password }
  f.name 'Jim Jones'
end

Factory.define :question, :class => Rostra::Question do |f|
  f.title "Why is the sky blue?"
  f.details "Maybe it's because of oxygen"
  f.tag_list "red, green, yellow"
  f.association :user
end
