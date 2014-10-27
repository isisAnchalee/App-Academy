require 'addressable/uri'
require 'rest-client'


# my_script.rb
def create_contact
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts.json'
  ).to_s

  puts RestClient.post(
    url,
    { contact: { name: "Gizmo", email: "gizmo@gizmo.gizmo", user_id: 1 } }
  )
end

create_contact
