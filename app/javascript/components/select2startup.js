import $ from "jquery";
import "select2";
// import 'select2/dist/css/select2.min.css';


const select2startup = () => {
  $('#mySelect').select2({
  dropdownParent: $('#my-modal-body'),
  width: '100%',
  background: 'white'
   });

  $(document).on('select2:open', () => {
    document.querySelector('.select2-search__field').focus();
  });

}

export { select2startup };
