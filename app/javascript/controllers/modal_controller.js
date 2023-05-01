import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['modal'];

  open(event) {
    event.preventDefault();
    this.modalTarget.classList.remove('hidden');
  }

  open_with_event(event) {
    this.modalTarget.classList.remove('hidden');
  }

  close(event) {
    event.preventDefault();
    this.modalTarget.classList.add('hidden');
  }
}
