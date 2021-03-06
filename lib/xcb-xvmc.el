;;; -*- lexical-binding: t -*-
;; This file was generated from `xvmc.xml' by `el_client.el'.

(require 'xcb-types)

(defconst xcb:xvmc:-extension-xname "XVideo-MotionCompensation")
(defconst xcb:xvmc:-extension-name "XvMC")
(defconst xcb:xvmc:-major-version 1)
(defconst xcb:xvmc:-minor-version 1)

(require 'xcb-xv)

(xcb:deftypealias 'xcb:xvmc:CONTEXT 'xcb:-u4)

(xcb:deftypealias 'xcb:xvmc:SURFACE 'xcb:-u4)

(xcb:deftypealias 'xcb:xvmc:SUBPICTURE 'xcb:-u4)

(defclass xcb:xvmc:SurfaceInfo
  (xcb:-struct)
  ((id :initarg :id :type xcb:xvmc:SURFACE)
   (chroma-format :initarg :chroma-format :type xcb:CARD16)
   (pad0 :initarg :pad0 :type xcb:CARD16)
   (max-width :initarg :max-width :type xcb:CARD16)
   (max-height :initarg :max-height :type xcb:CARD16)
   (subpicture-max-width :initarg :subpicture-max-width :type xcb:CARD16)
   (subpicture-max-height :initarg :subpicture-max-height :type xcb:CARD16)
   (mc-type :initarg :mc-type :type xcb:CARD32)
   (flags :initarg :flags :type xcb:CARD32)))

(defclass xcb:xvmc:QueryVersion
  (xcb:-request)
  ((~opcode :initform 0 :type xcb:-u1)))
(defclass xcb:xvmc:QueryVersion~reply
  (xcb:-reply)
  ((pad~0 :initform 1 :type xcb:-pad)
   (major :initarg :major :type xcb:CARD32)
   (minor :initarg :minor :type xcb:CARD32)))

(defclass xcb:xvmc:ListSurfaceTypes
  (xcb:-request)
  ((~opcode :initform 1 :type xcb:-u1)
   (port-id :initarg :port-id :type xcb:xvmc:PORT)))
(defclass xcb:xvmc:ListSurfaceTypes~reply
  (xcb:-reply)
  ((pad~0 :initform 1 :type xcb:-pad)
   (num :initarg :num :type xcb:CARD32)
   (pad~1 :initform 20 :type xcb:-pad)
   (surfaces :initarg :surfaces :type xcb:-ignore)
   (surfaces~ :initform
	      '(name surfaces type xcb:xvmc:SurfaceInfo size
		     (xcb:-fieldref 'num))
	      :type xcb:-list)))

(defclass xcb:xvmc:CreateContext
  (xcb:-request)
  ((~opcode :initform 2 :type xcb:-u1)
   (context-id :initarg :context-id :type xcb:xvmc:CONTEXT)
   (port-id :initarg :port-id :type xcb:xvmc:PORT)
   (surface-id :initarg :surface-id :type xcb:xvmc:SURFACE)
   (width :initarg :width :type xcb:CARD16)
   (height :initarg :height :type xcb:CARD16)
   (flags :initarg :flags :type xcb:CARD32)))
(defclass xcb:xvmc:CreateContext~reply
  (xcb:-reply)
  ((pad~0 :initform 1 :type xcb:-pad)
   (width-actual :initarg :width-actual :type xcb:CARD16)
   (height-actual :initarg :height-actual :type xcb:CARD16)
   (flags-return :initarg :flags-return :type xcb:CARD32)
   (pad~1 :initform 20 :type xcb:-pad)
   (priv-data :initarg :priv-data :type xcb:-ignore)
   (priv-data~ :initform
	       '(name priv-data type xcb:CARD32 size
		      (xcb:-fieldref 'length))
	       :type xcb:-list)))

(defclass xcb:xvmc:DestroyContext
  (xcb:-request)
  ((~opcode :initform 3 :type xcb:-u1)
   (context-id :initarg :context-id :type xcb:xvmc:CONTEXT)))

(defclass xcb:xvmc:CreateSurface
  (xcb:-request)
  ((~opcode :initform 4 :type xcb:-u1)
   (surface-id :initarg :surface-id :type xcb:xvmc:SURFACE)
   (context-id :initarg :context-id :type xcb:xvmc:CONTEXT)))
(defclass xcb:xvmc:CreateSurface~reply
  (xcb:-reply)
  ((pad~0 :initform 1 :type xcb:-pad)
   (pad~1 :initform 24 :type xcb:-pad)
   (priv-data :initarg :priv-data :type xcb:-ignore)
   (priv-data~ :initform
	       '(name priv-data type xcb:CARD32 size
		      (xcb:-fieldref 'length))
	       :type xcb:-list)))

(defclass xcb:xvmc:DestroySurface
  (xcb:-request)
  ((~opcode :initform 5 :type xcb:-u1)
   (surface-id :initarg :surface-id :type xcb:xvmc:SURFACE)))

(defclass xcb:xvmc:CreateSubpicture
  (xcb:-request)
  ((~opcode :initform 6 :type xcb:-u1)
   (subpicture-id :initarg :subpicture-id :type xcb:xvmc:SUBPICTURE)
   (context :initarg :context :type xcb:xvmc:CONTEXT)
   (xvimage-id :initarg :xvimage-id :type xcb:CARD32)
   (width :initarg :width :type xcb:CARD16)
   (height :initarg :height :type xcb:CARD16)))
(defclass xcb:xvmc:CreateSubpicture~reply
  (xcb:-reply)
  ((pad~0 :initform 1 :type xcb:-pad)
   (width-actual :initarg :width-actual :type xcb:CARD16)
   (height-actual :initarg :height-actual :type xcb:CARD16)
   (num-palette-entries :initarg :num-palette-entries :type xcb:CARD16)
   (entry-bytes :initarg :entry-bytes :type xcb:CARD16)
   (component-order :initarg :component-order :type xcb:-ignore)
   (component-order~ :initform
		     '(name component-order type xcb:CARD8 size 4)
		     :type xcb:-list)
   (pad~1 :initform 12 :type xcb:-pad)
   (priv-data :initarg :priv-data :type xcb:-ignore)
   (priv-data~ :initform
	       '(name priv-data type xcb:CARD32 size
		      (xcb:-fieldref 'length))
	       :type xcb:-list)))

(defclass xcb:xvmc:DestroySubpicture
  (xcb:-request)
  ((~opcode :initform 7 :type xcb:-u1)
   (subpicture-id :initarg :subpicture-id :type xcb:xvmc:SUBPICTURE)))

(defclass xcb:xvmc:ListSubpictureTypes
  (xcb:-request)
  ((~opcode :initform 8 :type xcb:-u1)
   (port-id :initarg :port-id :type xcb:xvmc:PORT)
   (surface-id :initarg :surface-id :type xcb:xvmc:SURFACE)))
(defclass xcb:xvmc:ListSubpictureTypes~reply
  (xcb:-reply)
  ((pad~0 :initform 1 :type xcb:-pad)
   (num :initarg :num :type xcb:CARD32)
   (pad~1 :initform 20 :type xcb:-pad)
   (types :initarg :types :type xcb:-ignore)
   (types~ :initform
	   '(name types type xcb:xvmc:ImageFormatInfo size
		  (xcb:-fieldref 'num))
	   :type xcb:-list)))



(provide 'xcb-xvmc)
