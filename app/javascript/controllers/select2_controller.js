import { Controller } from "@hotwired/stimulus";
import $ from "jquery";
import "select2";
import 'select2/dist/css/select2.min.css';

export default class extends Controller {
  connect() {
    //  $(this.element).select2();
     $('#mySelect').select2({
       dropdownParent: $('#my-modal-body'),
       width: '100%',
       background: 'white'
   });
  $(document).on('select2:open', () => {
    document.querySelector('.select2-search__field').focus();
  });

  }
}
