class Person extends React.Component {
  render() {
    return (<li className="list-group-item"><a href={"/people/" + this.props.id + "/edit"}>{this.props.name} from {this.props.city}, {this.props.state}</a></li>)
  }
}

class Application extends React.Component {
  constructor(props) {
    super(props)

    this.state = { people: props.people }
  }

  search(event) {
    let params = new URLSearchParams()
    params.append("q", event.target.value)

    fetch('/people.json?' + params, {headers: { 'Content-Type': 'application/json' }}).
      then((response) => {
        return response.json()
      }).then((data) => {
        this.setState({people: data})
      })
  }

  render() {
    return (<div>
      <ul className="list-group">
        <li className="list-group-item searchbox">
          <input onChange={this.search.bind(this)} type="text" placeholder="Search..."/>
        </li>
        {this.state.people.map(person => <Person key={person.id} {...person}/>)}
      </ul>

    </div>);
  }
}
