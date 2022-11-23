import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";


export default class extends Controller {
  static targets = [ 'startDateInput', 'endDateInput' ]
  static values = { dates: Object}

  connect() {
    this.#initFlatPickr()

    flatpickr(this.startDateInputTarget, {
      mode: 'multiple',
      "plugins": [new rangePlugin({ input: this.endDateInputTarget})],
      minDate : "today",
      // dateFormat: "d/m/Y",

    })
  }

  #initFlatPickr() {
    flatpickr(".datepicker", this.#options());
  }

  #options() {
    return {
      ...this.#parsedBookedDates(),
      enableTime: true,
      minDate: new Date(),
    }
  }

  #parsedBookedDates() {
    return this.datesValue
  }
}
