function activateDatePicker(){
    $('.datepicker').pickadate({
        selectMonths: true, // Creates a dropdown to control month
        selectYears: 5, // Creates a dropdown of 15 years to control year
        firstDay: 1, // Weeks starts on Monday
        closeOnClear: true,
        cancel: "Annuler",
        clear: "Réinitialiser",
        today: "Aujourd'hui",
        months: [
            'Janvier',
            'Février',
            'Mars',
            'Avril',
            'Mai',
            'Juin',
            'Juillet',
            'Août',
            'Spetembre',
            'Octobre',
            'Novembre',
            'Décembre'
        ],
        weekdays: ['Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche'],
        onSet: function( arg ){
            if ( 'select' in arg ){ //prevent closing on selecting month/year
                this.close();
            }
        }
    });
};

function nextFridayDate(date) {
    if (date.getDay() == 5){
        return date;
    } else {
        diff = Math.abs( 5 - date.getDay() );
        return new Date(Date.parse(date) + diff*24*60*60*1000);
    };
}

function addDaysToDate(date, days){
    return new Date(Date.parse(date.toString()) + days*24*60*60*1000);
};