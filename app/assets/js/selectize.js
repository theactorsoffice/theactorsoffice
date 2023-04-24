
$("#select-tag").selectize({

      persist: !1,
                createOnBlur: !0,
                create: !0  ,
    
    
    plugins: ["remove_button"],
  delimiter: ",",
  persist: false,
  create: function (input) {
    return {
      value: input,
      text: input,
    };
  },
    
    
});
