import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";


export default class extends Controller {
  static targets = [ 'startDateInput', 'endDateInput' ]
  static values = { dates: Object}

  connect() {
    this.#initFlatPickr()
  }

  #initFlatPickr() {
    flatpickr(this.startDateInputTarget, this.#options());
  }

  #options() {
    return {
      dateFormat: this.#parsedBookedDates().dateFormat,
      disable: [...this.#parsedBookedDates().disable],
      mode: 'range',
      "plugins": [new rangePlugin({ input: this.endDateInputTarget})],
      minDate: "today",
    }
  }

  #parsedBookedDates() {
    return this.datesValue
  }
}
