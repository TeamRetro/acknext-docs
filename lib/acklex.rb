# -*- coding: utf-8 -*- #

module Rouge
  module Lexers
    class AckC < Rouge::Lexers::C
      tag 'ack'
      title "Acknext C"
      desc "The C programming language, modified for Acknext"
      def self.keywords_type
				super
        @keywords_type.merge(%w(
					EVENT EVENTHANDLER BLOB GLDATA ACKFILE BUTTONSTATE
					VIEW BITMAP SHADER UNIFORM BUFFER ENTITY
					var BITFIELD QUATERNION MATRIX COLOR TASK
					VECTOR2 VECTOR VECTOR4 POINT SIZE UVCOORD
					VERTEX MATERIAL MESH MODEL CAMERA INDEX
					BUFFERTYPE CAMERATYPE ERROR LIGHTTYPE PIXELFORMAT
					SHADERTYPE SHADERVAR STAGETYPE TASKSTATE TEXTURETYPE
        ))
      end
		end
  end
end