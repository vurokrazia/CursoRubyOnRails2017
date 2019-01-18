class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
  delegate :content_tag, to: :@template 
  def label name, *args
    content_tag :div, class:"col-md-4" do
        super(name,options)
    end
  end
  def submit *args
    options = args.extract_options!
    extClass = " btn btn-primary btn-block"
    if options.has_key?(:class)
        options[:class] += extClass
    else
        options[:class] = extClass
    end
    content_tag :div, class:"col-md-4" do
      super(*args,options)
    end    
  end
  [:text_area,:check_box, :email_field, :password_field, :text_field, :number_field, :file_field].each do |metodo|
    define_method metodo do |name, *args|
      options = args.extract_options!
      extClass = " form-control"
      if options.has_key?(:class)
        options[:class] += extClass
      else
        options[:class] = extClass
      end
      content_tag :div, class:"col-md-8" do
        content_tag :div, class:"form-group" do
          super(name,options)
        end
      end
    end
  end
  def errors
    if object.errors.any?
      content_tag :div, class:"col-md-12 my-3" do
        content_tag(:h2, "Errores") +
        content_tag(:ul) do
          lis = ""
          object.errors.full_messages.each do |err|
            lis += content_tag :li, err
          end
          lis.html_safe
        end
      end
    end
  end
end