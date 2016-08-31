module Components
  class PersonComponent < React::Component::Base
    param :person, type: Hash

    def render
      li(class: "list-group-item") do
        a(href: "/people/#{params["id"]}/edit") do
          "#{params.person["name"]} from #{params.person["city"]}, #{params.person["state"]}"
        end
      end
    end
  end
end
