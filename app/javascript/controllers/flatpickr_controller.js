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
      // dateFormat: "Y-m-d", disable: [{ from: date, to: date }, { from: date,to: date }]
      ...this.#parsedBookedDates(),
      // fonctionne lorsque je le fais en dur
      disable: [{from: "2022-11-23", to: "2022-11-30"}],
      mode: 'range',
      "plugins": [new rangePlugin({ input: this.endDateInputTarget})],
      dateFormat: "Y-m-d",
      minDate: "today",
    }
  }

  #parsedBookedDates() {
    return this.datesValue
  }
}
