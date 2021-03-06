from libc.stdint cimport uint8_t

cimport libav as lib

from av.frame cimport Frame
from av.video.format cimport VideoFormat
from av.video.reformatter cimport VideoReformatter


cdef class VideoFrame(Frame):
    
    # This is the buffer that is used to back everything in the AVPicture/AVFrame.
    # We don't ever actually access it directly.
    cdef uint8_t *_buffer

    cdef VideoReformatter reformatter

    cdef readonly VideoFormat format

    cdef _init(self, lib.AVPixelFormat format, unsigned int width, unsigned int height)
    cdef _init_properties(self)

    cdef _reformat(self, unsigned int width, unsigned int height, lib.AVPixelFormat format, int src_colorspace, int dst_colorspace)


cdef VideoFrame alloc_video_frame()
