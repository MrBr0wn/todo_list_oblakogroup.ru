$(document).ready(function() {

  // Update todo item and switch checkbox
  $('a').click(function () {
    event.preventDefault();
    $('a').on('ajax:success', function (event) {
        let detail = event.detail;
        console.log();
        if (detail[1] == "OK") {
          if (detail[0].todo.isCompleted) {
            $(this).addClass('is-strikethrough');
            $(this).find("input").prop('checked', 'checked');
          } else {
            $(this).removeClass('is-strikethrough');
            $(this).find("input").prop('checked', '');
          }
        } else {

            console.log("Todo respond error");
        }
    });
  });

  // Insert category title field to the creating todo item form
  $('#todo_project_id').on('change', function () {
    if ($(this).val() == '') {
      $('#todo_project').removeClass('is-hidden');
    } else {

      $('#todo_project').addClass('is-hidden');
    }
  });

  $('#close-modal-btn').click(function (event) {
    console.log('btn close')
    event.preventDefault();
  })

  // Functions to open and close a modal
  function openModal($el) {
    $el.classList.add('is-active');
  }

  function closeModal($el) {
    $el.classList.remove('is-active');
  }

  function closeAllModals() {
    (document.querySelectorAll('.modal') || []).forEach(($modal) => {
      closeModal($modal);
    });
  }

  // Add a click event on buttons to open a specific modal
  (document.querySelectorAll('.js-modal-trigger') || []).forEach(($trigger) => {
    const modal = $trigger.dataset.target;
    const $target = document.getElementById(modal);
    console.log($target);

    $trigger.addEventListener('click', () => {
      openModal($target);
    });
  });

  // Add a click event on various child elements to close the parent modal
  (document.querySelectorAll('.modal-background, .modal-close, .modal-card-head .delete, .modal-card-foot .button') || []).forEach(($close) => {
    const $target = $close.closest('.modal');

    $close.addEventListener('click', () => {
      closeModal($target);
    });
  });

  // Add a keyboard event to close all modals
  document.addEventListener('keydown', (event) => {
    const e = event || window.event;

    if (e.keyCode === 27) { // Escape key
      closeAllModals();
    }
  });
});
