import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['loading'];

  open(event) {
    debugger;
    event.preventDefault();
    this.loadingTarget.classList.remove('hidden');
  }

  close(event) {
    debugger;
    event.preventDefault();
    this.loadingTarget.classList.add('hidden');
  }
}
