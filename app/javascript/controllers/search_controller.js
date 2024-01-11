import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["input", "suggestions"]
  connect() {
    console.log('connected')
    document.addEventListener('click', (event)=> {
        if (!this.element.contains(event.target)) {
          this.hideSuggestions()
        }
    })
  }

  suggestions() {
    const query = this.inputTarget.value
    const url = this.element.dataset.suggestionsUrl
    clearTimeout(this.timeout)

    this.timeout = setTimeout(() => {
      this.requestSuggestions(query, url)
    }, 500)
    
  }

  requestSuggestions(query, url) {
    if (query.length === 0) {
      this.hideSuggestions()
      return;
    }
    this.showSuggestions()
    fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": 'application/json',
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content
      },
      body: JSON.stringify({ query: query })
    }).then((res)=> {
        res.text().then((html) => {
          document.body.insertAdjacentHTML('beforeend', html)
        })
    })
  }

  childCliked(event) {
    this.childWasClicked = this.element.contains(event.target)
  }

  hideSuggestions() {
    if (!this.childWasClicked) {
      this.suggestionsTarget.classList.add('d-none');
    }
    this.childWasClicked = false
  }
  
  showSuggestions() {
    this.suggestionsTarget.classList.remove('d-none')
  }
}
