import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"
import {French} from "flatpickr/dist/l10n/fr.js"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

flatpickr(".datepicker_start", {
  altInput: true,
  mode: "range",
  plugins: [new rangePlugin({ input: ".datepicker_end"})],
  locale: French
})


// flatpickr(".datepicker_end", {
//   altInput: true,
//   locale: French
// })
