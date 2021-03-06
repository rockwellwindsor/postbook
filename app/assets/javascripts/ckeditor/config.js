CKEDITOR.editorConfig = function(config) {
    config.language = 'en';
    // config.width = '700';
    config.height = '350';
    config.filebrowserBrowseUrl = "/ckeditor/attachment_files";
    config.filebrowserImageBrowseLinkUrl = "https://s3-us-west-2.amazonaws.com/windsordesignstudio/posts/";
    config.filebrowserImageBrowseUrl = "/ckeditor/pictures"; // url for the window
    config.filebrowserImageUploadUrl = "https://s3-us-west-2.amazonaws.com/windsordesignstudio/postbook/";
    config.filebrowserUploadUrl = "/ckeditor/attachment_files";
    config.extraPlugins = 'insertpre';
    config.toolbar = 'Pure';
    config.allowedContent = true;

    config.toolbar_Pure = [
        { name: 'document', items : [ 'Source','-','Save','NewPage','DocProps','Preview','Print','-','Templates' ] },
        { name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
        { name: 'editing', items : [ 'Find','Replace','-','SelectAll','-','SpellChecker', 'Scayt' ] },
        { name: 'forms', items : [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'HiddenField' ] },
        '/',
        { name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
        { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv',
        '-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl' ] },
        { name: 'links', items : [ 'Link','Unlink','Anchor', 'InsertPre' ] },
        { name: 'insert', items : [ 'Table','HorizontalRule','Smiley','SpecialChar','PageBreak','Iframe' ] },
        '/',
        { name: 'styles', items : [ 'Styles','Format','Font','FontSize','insertpre' ] },
        { name: 'colors', items : [ 'TextColor','BGColor' ] },
        { name: 'tools', items : [ 'Maximize', 'ShowBlocks','-','About' ] }
    ];

    return true;   
}