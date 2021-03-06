import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const initFlatpickr = () => {
  flatpickr("#range_start", {
    altInput: true,
    plugins: [new rangePlugin({ input: "#range_end" })],
    disable: [
      function (date) {
        // return true to disable
        return (date < Date.now());
      }
    ],
  });
};

export { initFlatpickr };