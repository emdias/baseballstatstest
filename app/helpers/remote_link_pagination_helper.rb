module RemoteLinkPaginationHelper


  # makes will_paginate use data-remote attribute
  # based on https://gist.github.com/jeroenr/3142686
  class LinkRenderer < WillPaginate::ActionView::LinkRenderer
    def link(text, target, attributes = {})
      attributes['data-remote'] = true
      super
    end
  end
end