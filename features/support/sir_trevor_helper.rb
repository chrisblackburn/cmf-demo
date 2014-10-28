module Cdp
  module CmsHelper
    def sir_trevor_container(contents)
      """
      {\"data\":[
        #{contents.join(",\n")}
      ]}
      """
    end

    def sir_trevor_video
      '{"type":"video","data":{"source":"youtube","remote_id":"wG2C3JbaaUo"}}'
    end

    def sir_trevor_heading
      '{"type":"heading","data":{"text":"Check out this article"}}'
    end

    def sir_trevor_text
      '{"type":"text","data":{"text":"fsdfdsfdsf\nfdsfds\nfdsfdsf\nfdsfdsfds\n"}}'
    end

    def sir_trevor_file
      '{"type":"file","data":{"file":{"url":"/system/sir_trevor_files/files/000/000/005/original/Competitions_01Sept_LS_Comments.pdf?1414496492"}}}'
    end

    def sir_trevor_image
      '{"type":"image","data":{"file":{"url":"/system/sir_trevor_files/files/000/000/004/original/shoot-2.jpg?1414496474"}}}'
    end

    def sir_trevor_embed
      '{"type":"embed","data":{"embed":"<iframe src=\"//www.slideshare.net/slideshow/embed_code/40665069\" width=\"425\" height=\"355\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling=\"no\" allowfullscreen></iframe>"}}'
    end
  end
end
