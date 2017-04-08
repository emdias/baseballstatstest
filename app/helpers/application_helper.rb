module ApplicationHelper

  # makes will_paginate use data-remote attribute
  # based on https://gist.github.com/jeroenr/3142686
  def paginate(collection, params= {})
    will_paginate collection, params.merge(:renderer => RemoteLinkPaginationHelper::LinkRenderer)
  end
end
