// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
    (function() {    
        callback = '127.0.0.1/gifts'
        //Initialize the crowdtilt object
        crowdtilt.init();

        var responseHandler = function(response) {
          console.log(response)
            switch (response.status) {
               case 201:
                  console.log(response)
                   // The card or bank was created successfully!
                   // Submit the data contained in response.card or repsonse.bank to your server for saving
                   // For bank accounts, remember to set the new account as the default in addition to saving it to your database
                   break;
               case 400:
                  console.log(response)
                   // missing field - check response.error for details
                   break;
               case 404:
                  console.log(response)
                   // your user_id is incorrect (no user was found)
                   break;
               default:
                   console.log(response)
            }
        }

        var tokenizeCard = function(e) {
            e.preventDefault();

            var $form = $('form#cardForm');
            var cardData = {
                number: $form.find('[name="card_number"]').val(),
                expiration_month: $form.find('[name="expiration_month"]').val(),
                expiration_year: $form.find('[name="expiration_year"]').val(),
                security_code: $form.find('[name="security_code"]').val()
            };
            var user_id = $form.find('[name="user_id"]').val();

            crowdtilt.card.create(user_id, cardData, callback);
        };
        $('#cardForm').submit(tokenizeCard);        

        var tokenizeBankAccount = function(e) {
            e.preventDefault();

            var $form = $('form#bankForm');
            var bankAccountData = {
                name: $form.find('[name="name"]').val(),
                account_number: $form.find('[name="account_number"]').val(),
                bank_code: $form.find('[name="bank_code"]').val()
            };
            var user_id = $form.find('[name="user_id"]').val();

            crowdtilt.bank.create(user_id, bankAccountData, callback);
        };
        $('#bankForm').submit(tokenizeBankAccount);
    })();
