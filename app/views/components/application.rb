module Components
  class Application < React::Component::Base
    param :people, type: [Hash]

    before_mount do
      state.people! params.people
    end

    def search(query)
      HTTP.get("/people.json?q=#{query}") do |response|
        state.people! response.json
      end
    end

    def people_count
      [state.people.size, state.people.size < 2 ? "Person" : "People", "Found"].join(" ")
    end

    def render
      ul(class: "list-group") do
        li(class: "list-group-item searchbox") do
          input(type: "text", placeholder: "Search").
            on(:change) { |event| search(event.target.value) }
        end
        li(class: "list-group-item") { people_count }

        state.people.each do |person|
          PersonComponent person: person
        end
      end
    end
  end
end
