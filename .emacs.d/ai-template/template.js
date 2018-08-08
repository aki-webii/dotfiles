/**
 * %file% - ????
 *  
 * @package ????
 * @access public
 * @author %name% <%mail%> 
 * @create %cdate%
 * @version $Id$
 * @copyright Copyright (C) %cyear%, rakuten 
 */

;(function($) {
  //--------------------
  // Add entry points
  $.fn.extend({
    // Entry point
    %base%: function ( options ){
      // Return null if element does not found 
      if ( ! $(this).length )
        return null;
      // new Object
      return new $.%cap%( $(this) , options );
    }
  });
  //--------------------
  // Constructor
  $.%cap% = function ( nodes , options ){
    // Save target nodes
    this.targets = nodes;
    // 
    this.settings = $.extend( {} ,
                              $.%cap%.defaults ,
                              options );
    // Initialize
    this.init();
  };
  //--------------------
  // Implements
  $.extend($.%cap% , {
    // Default options
    defaults: {
    },
    // Members
    prototype: {
      // Target nodes
      targets: null,
      // Valid options
      settings: {},
      // Constructor
      init: function() {
      }
    }
  });
})(jQuery)