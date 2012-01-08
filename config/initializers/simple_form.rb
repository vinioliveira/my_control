# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|

  require 'simple_form/date_picker'
  require 'simple_form/color_picker'
  require 'simple_form/input_action'
  
  config.wrappers :inline, :class => 'clearfix', :error_class => :error do |b|
   b.use :placeholder
     b.use :label
     
     b.use :tag => 'div', :class => 'input' do |ba|
       ba.use :input
       ba.use :error, :tag => :span, :class => :'help-inline'
       ba.use :hint,  :tag => :span, :class => :'help-block'
     end
  end

  config.wrappers :stacked, :class => "clearfix", :error_class => :error do |b|
    b.use :placeholder
    b.use :label
    b.use :hint,  :tag => :span, :class => :'help-block'
    b.use :tag => 'div', :class => 'input' do |input|
      input.use :input
      input.use :error, :tag => :span, :class => :'help-inline'
    end
  end

  config.wrappers :prepend, :class => "clearfix", :error_class => :error do |b|
    b.use :placeholder
    b.use :label
    b.use :hint,  :tag => :span, :class => :'help-block'
    b.use :tag => 'div', :class => 'input' do |input|
      input.use :tag => 'div', :class => 'input-prepend' do |prepend|
        prepend.use :input
      end
      input.use :error, :tag => :span, :class => :'help-inline'
    end
  end

  config.wrappers :append, :class => "clearfix", :error_class => :error do |b|
    b.use :placeholder
    b.use :label
    b.use :hint,  :tag => :span, :class => :'help-block'
    b.use :tag => 'div', :class => 'input' do |input|
      input.use :tag => 'div', :class => 'input-append' do |append|
        append.use :input
      end
      input.use :error, :tag => :span, :class => :'help-inline'
    end
  end
  
  config.label_text = lambda { |label, required| "#{label} #{required}" }
  
  config.browser_validations = false
  
  config.button_class = 'btn'
end
