import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['loading'];

  open(event) {
    event.preventDefault();
    this.loadingTarget.classList.remove('hidden');
  }

  close(event) {
    event.preventDefault();
    this.loadingTarget.classList.add('hidden');
  }
}
