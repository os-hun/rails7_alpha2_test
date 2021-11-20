import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="auth"
export default class extends Controller {
  connect() {
  }

  async logOut() {
    const csrfToken = document.querySelector('meta[name="csrf-token"]')

    const response = await fetch('/auth/log_out', {
      method: 'DELETE',
      credentials: 'include',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        authenticity_token: csrfToken.content,
      }),
    })

    if (response.ok) location.href = '/auth/log_in'
  }
}
