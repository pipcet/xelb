;;; -*- lexical-binding: t -*-
;; This file was generated from `shm.xml' by `el_client.el'.

(require 'xcb-types)

(defconst xcb:shm:-extension-xname "MIT-SHM")
(defconst xcb:shm:-extension-name "Shm")
(defconst xcb:shm:-major-version 1)
(defconst xcb:shm:-minor-version 2)

(require 'xcb-xproto)

(xcb:deftypealias 'xcb:shm:SEG 'xcb:-u4)

(defclass xcb:shm:Completion
  (xcb:-event)
  ((pad~0 :initform 1 :type xcb:-pad)
   (drawable :initarg :drawable :type xcb:DRAWABLE)
   (minor-event :initarg :minor-event :type xcb:CARD16)
   (major-event :initarg :major-event :type xcb:BYTE)
   (pad~1 :initform 1 :type xcb:-pad)
   (shmseg :initarg :shmseg :type xcb:shm:SEG)
   (offset :initarg :offset :type xcb:CARD32)))

(defclass xcb:shm:BadSeg
  (xcb:-error xcb:Value)
  nil)

(defclass xcb:shm:QueryVersion
  (xcb:-request)
  ((~opcode :initform 0 :type xcb:-u1)))
(defclass xcb:shm:QueryVersion~reply
  (xcb:-reply)
  ((shared-pixmaps :initarg :shared-pixmaps :type xcb:BOOL)
   (major-version :initarg :major-version :type xcb:CARD16)
   (minor-version :initarg :minor-version :type xcb:CARD16)
   (uid :initarg :uid :type xcb:CARD16)
   (gid :initarg :gid :type xcb:CARD16)
   (pixmap-format :initarg :pixmap-format :type xcb:CARD8)
   (pad~0 :initform 15 :type xcb:-pad)))

(defclass xcb:shm:Attach
  (xcb:-request)
  ((~opcode :initform 1 :type xcb:-u1)
   (shmseg :initarg :shmseg :type xcb:shm:SEG)
   (shmid :initarg :shmid :type xcb:CARD32)
   (read-only :initarg :read-only :type xcb:BOOL)
   (pad~0 :initform 3 :type xcb:-pad)))

(defclass xcb:shm:Detach
  (xcb:-request)
  ((~opcode :initform 2 :type xcb:-u1)
   (shmseg :initarg :shmseg :type xcb:shm:SEG)))

(defclass xcb:shm:PutImage
  (xcb:-request)
  ((~opcode :initform 3 :type xcb:-u1)
   (drawable :initarg :drawable :type xcb:DRAWABLE)
   (gc :initarg :gc :type xcb:GCONTEXT)
   (total-width :initarg :total-width :type xcb:CARD16)
   (total-height :initarg :total-height :type xcb:CARD16)
   (src-x :initarg :src-x :type xcb:CARD16)
   (src-y :initarg :src-y :type xcb:CARD16)
   (src-width :initarg :src-width :type xcb:CARD16)
   (src-height :initarg :src-height :type xcb:CARD16)
   (dst-x :initarg :dst-x :type xcb:INT16)
   (dst-y :initarg :dst-y :type xcb:INT16)
   (depth :initarg :depth :type xcb:CARD8)
   (format :initarg :format :type xcb:CARD8)
   (send-event :initarg :send-event :type xcb:CARD8)
   (pad~0 :initform 1 :type xcb:-pad)
   (shmseg :initarg :shmseg :type xcb:shm:SEG)
   (offset :initarg :offset :type xcb:CARD32)))

(defclass xcb:shm:GetImage
  (xcb:-request)
  ((~opcode :initform 4 :type xcb:-u1)
   (drawable :initarg :drawable :type xcb:DRAWABLE)
   (x :initarg :x :type xcb:INT16)
   (y :initarg :y :type xcb:INT16)
   (width :initarg :width :type xcb:CARD16)
   (height :initarg :height :type xcb:CARD16)
   (plane-mask :initarg :plane-mask :type xcb:CARD32)
   (format :initarg :format :type xcb:CARD8)
   (pad~0 :initform 3 :type xcb:-pad)
   (shmseg :initarg :shmseg :type xcb:shm:SEG)
   (offset :initarg :offset :type xcb:CARD32)))
(defclass xcb:shm:GetImage~reply
  (xcb:-reply)
  ((depth :initarg :depth :type xcb:CARD8)
   (visual :initarg :visual :type xcb:VISUALID)
   (size :initarg :size :type xcb:CARD32)))

(defclass xcb:shm:CreatePixmap
  (xcb:-request)
  ((~opcode :initform 5 :type xcb:-u1)
   (pid :initarg :pid :type xcb:PIXMAP)
   (drawable :initarg :drawable :type xcb:DRAWABLE)
   (width :initarg :width :type xcb:CARD16)
   (height :initarg :height :type xcb:CARD16)
   (depth :initarg :depth :type xcb:CARD8)
   (pad~0 :initform 3 :type xcb:-pad)
   (shmseg :initarg :shmseg :type xcb:shm:SEG)
   (offset :initarg :offset :type xcb:CARD32)))

(defclass xcb:shm:AttachFd
  (xcb:-request)
  ((~opcode :initform 6 :type xcb:-u1)
   (shmseg :initarg :shmseg :type xcb:shm:SEG)
   (shm-fd :type xcb:-fd)
   (read-only :initarg :read-only :type xcb:BOOL)
   (pad~0 :initform 3 :type xcb:-pad)))

(defclass xcb:shm:CreateSegment
  (xcb:-request)
  ((~opcode :initform 7 :type xcb:-u1)
   (shmseg :initarg :shmseg :type xcb:shm:SEG)
   (size :initarg :size :type xcb:CARD32)
   (read-only :initarg :read-only :type xcb:BOOL)
   (pad~0 :initform 3 :type xcb:-pad)))
(defclass xcb:shm:CreateSegment~reply
  (xcb:-reply)
  ((nfd :initarg :nfd :type xcb:CARD8)
   (shm-fd :type xcb:-fd)
   (pad~0 :initform 24 :type xcb:-pad)))

(defconst xcb:shm:error-number-class-alist
  '((0 . xcb:shm:BadSeg))
  "(error-number . error-class) alist")

(defconst xcb:shm:event-number-class-alist
  '((0 . xcb:shm:Completion))
  "(event-number . event-class) alist")



(provide 'xcb-shm)
