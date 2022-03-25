import * as htmlToImage from 'html-to-image';
// import { toPng, toJpeg, toBlob, toPixelData, toSvg } from 'html-to-image';
import { csrfToken } from "@rails/ujs";


const monimage = () => {
  const node = document.getElementById('monid1');
  node.addEventListener('click', obtainImage(node));
  console.log("connecté à  monid")
  $('#myModal').modal('show');
}


const obtainImage = (message) => {
  return(e) => {

    console.log("node repéré");
    htmlToImage.toPng(message)

    .then( (dataUrl) => {
      console.log("ok pour image");
      var img = new Image();
      img.src = dataUrl;
      document.body.appendChild(img);
      return img;
    })
    .then ( (img) => {
      console.log("ajout id effectué");
      img.setAttribute("id","monimage");
      let fd = new FormData();
      fd.append("image", img.src);
      const url = "/pages/ajax";
      fetch(url, {
        method: 'POST',
          headers: { 'Accept': "application/json", 'X-CSRF-Token': csrfToken() },
          body: fd
        })
        .then( ()=> {
          const nodes = document.getElementsByClassName("article-card-image")
          nodes[0].style = "background: url(https://cdn.futura-sciences.com/buildsv6/images/wide1920/5/5/a/55ac82ee41_50178246_cartographie-3d-forets.jpg), #F4EAF8; background-repeat: no-repeat; background-size: cover; background-position: 50% 50%; width: 100%;";
        })
      .then(response => response.json())
      .then(data => {
        console.log(data)
      })
      .catch(error => {
        console.error(error)
      })
      }
      )
    .catch(function (error) {
      console.error('oops, something went wrong!', error);
    })
  }
}

        // const fileInput = document.querySelector('#your-file-input') ;
        // const formData = new FormData();

        // formData.append('file', fileInput.files[0]);
        // const options = {
        //   method: 'POST',
        //   body: formData,
        //   // If you add this, upload won't work
        //   // headers: {
        //   //   'Content-Type': 'multipart/form-data',
        //   // }
        // };

        // fetch('your-upload-url', options);


export { monimage };
