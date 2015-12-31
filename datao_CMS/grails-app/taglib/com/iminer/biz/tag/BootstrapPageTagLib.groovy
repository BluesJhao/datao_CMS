
package com.iminer.biz.tag

/**
 * BootstrapPageTagLib：bootstrap分页标签
 * @author   fangjie fangjie@iminer.com
 * @version  V1.0
 * @date 	 2015-1-14 下午8:37:18
 */
class BootstrapPageTagLib {
	
	static namespace = 'bs'
	
	/**
	 * 普通分页标签
	 */
	def normalPageTag = { attr ->
		
		def total = attr.int('totalCount') ?: 0
		def action = (attr.action ?: (params.action ?: ""))
		def controller = (attr.controller ?: (params.controller ?: ""))
		def offset = params.int('offset') ?: 0
		def max = params.int('max')

		if (!offset) offset = (attr.int('offset') ?: 0)
		if (!max) max = (attr.int('max') ?: 10)
		
		int current = (offset / max) + 1
		int totalPage = (total % max)>0?(total/max+1):(total/max)
		
		int Length = 11	//最大长度
		int maxLength = attr.int('maxLength')?attr.int('maxLength')+1:Length+1
		int bothCurrent = 2 //当前页左右最多显示多少个
		int midLength = 6 //间隔多大时出现中间值           必须大于5
		int lessThanBothCurrent = 2 //不得小于bothCurrent
		
		//点击链接前缀
		String linkPrefix = '/'+grailsApplication.metadata['app.name']+'/'+controller+'/'+action+'?max='+max
		//点击链接相关请求参数
		String linkParams = ""
		params.each{ k,v ->
			if(k != 'controller' && k != 'action' && k != 'offset' && k != 'max'){
				linkParams += '&'+k+'='+v
			}
		}
		
		String outStr = ""
		
		if(total&&totalPage<=maxLength){
			outStr += '<nav><ul class="pagination">'
			//上一页按钮
			String prePageLink = ""
			if(current == 1){
				outStr += '<li class="disabled"><a href="#">&laquo;</a></li>'
			}else{
				String prevOffset = '&offset='+((current - 2)*max)
				outStr += '<li><a href="'+linkPrefix+prevOffset+linkParams+'">&laquo;</a></li>'
			}
			//详细页码
			(1..totalPage).each {
				String currentOffset = '&offset='+((it - 1)*max)
				if(it == current){
					outStr += '<li class="active"><a href="#">'+it+'<span class="sr-only">(current)</span></a></li>'
				}else{
					outStr += '<li><a href="'+linkPrefix+currentOffset+linkParams+'">'+it+'<span class="sr-only">(current)</span></a></li>'
				}
			}
			//下一页按钮
			if(current == totalPage){
				outStr += '<li class="disabled"><a href="#">&raquo;</a></li>'
			}else{
				String lastOffset = '&offset='+(current*max)
				outStr += '<li><a href="'+linkPrefix+lastOffset+linkParams+'">&raquo;</a></li>'
			}
			outStr += '</ul></nav>'
		}
		
		if(total&&totalPage>maxLength){
			outStr += '<nav><ul class="pagination">'
			
			if(current == 1){
				outStr += "<li class=\"disabled\"><a href=\"#\">&laquo;</a></li>"
			}else{
				String prevOffset = '&offset='+((current - 2)*max)
				outStr += '<li><a href="'+linkPrefix+prevOffset+linkParams+'">&laquo;</a></li>'
			}
			
			if((current-1)>bothCurrent){
				
				String firstOffset = '&offset=0'
				outStr += '<li><a href="'+linkPrefix+firstOffset+linkParams+'">1<span class="sr-only">(current)</span></a></li>'
				
				if(((current-bothCurrent)-1)>bothCurrent)//-------
					outStr += "<li><a href='#'>...</a></li>"
				if(((current-bothCurrent)-1)>midLength){//-------
					String currentOffset = "&offset=${(((current-bothCurrent-1)/2).asType(int)-1)*max}"
					outStr += '<li><a href="'+linkPrefix+currentOffset+linkParams+'">'+((current-bothCurrent-1)/2).asType(int)+'<span class="sr-only">(current)</span></a></li>'
				}
				int left = (current-bothCurrent)
				if(current>bothCurrent) left -= lessThanBothCurrent
				if(left<=1) left = 1
			}else{
				int i = current-1
				if((current-1)<=0)i=1
				(1..i).each {
					String currentOffset = '&offset='+((it - 1)*max)
					if(current == it){
						outStr += '<li class="active"><a href="#">'+it+'<span class="sr-only">(current)</span></a></li>'
					}else{
						outStr += '<li><a href="'+linkPrefix+currentOffset+linkParams+'">'+it+'<span class="sr-only">(current)</span></a></li>'
					}
					
				}
			}
			if(current!=1&&current!=totalPage)
				outStr += '<li class="active"><a href="#">'+current+'<span class="sr-only">(current)</span></a></li>'
			
			if((totalPage-current)>bothCurrent){
				int right = (current+bothCurrent)
				if(right>=totalPage) right = totalPage-1
				int index = 0
				((current+1)..right).each {
					index++
					if(current == it){
						outStr += '<li class="active"><a href="#">'+current+'<span class="sr-only">(current)</span></a></li>'
					}else {
						String currentOffset = '&offset='+((it - 1)*max)
						outStr += '<li><a href="'+linkPrefix+currentOffset+linkParams+'">'+it+'<span class="sr-only">(current)</span></a></li>'
					}
				}
				if((totalPage-(current+bothCurrent))>midLength){//------
					String currentOffset = '&offset='+((Math.round((totalPage-(current+index))/2+current+index)-1)*max)
					outStr += '<li><a href="'+linkPrefix+currentOffset+linkParams+'">'+(Math.round((totalPage-(current+index))/2+current+index))+'<span class="sr-only">(current)</span></a></li>'
				}
				if((totalPage-(current+bothCurrent))>bothCurrent)//-------
					outStr += "<li><a href='#'>...</a></li>"
				
				String lastOffset = '&offset='+((totalPage-1)*max)
				outStr += '<li><a href="'+linkPrefix+lastOffset+linkParams+'">'+totalPage+'<span class="sr-only">(current)</span></a></li>'
			}else{
				int i = current+1
				if((current+1)>=totalPage) i=totalPage
				(i..totalPage).each {
					if(current == it){
						outStr += '<li class="active"><a href="#">'+current+'<span class="sr-only">(current)</span></a></li>'
					}else{
						String currentOffset = '&offset='+((it-1)*max)
						outStr += '<li><a href="'+linkPrefix+currentOffset+linkParams+'">'+it+'<span class="sr-only">(current)</span></a></li>'
					}
				}
			}
			
			//下一页按钮
			if(current == totalPage){
				outStr += '<li class="disabled"><a href="#">&raquo;</a></li>'
			}else{
				String lastOffset = '&offset='+(current*max)
				outStr += '<li><a href="'+linkPrefix+lastOffset+linkParams+'">&raquo;</a></li>'
			}
			outStr += '</ul></nav>'
		}
		
		out << outStr
	
	}
	
	/**
		 * ajax分页标签
		 * 分页规则：0<pageNum<=10:显示全部页码
		 * 		  pageNum > 10 && currentPage <= 6: 1 2 3 4 5 6...
		 * 		  pageNum > 6 : 1 2 3 4 5 6... currentPage
		 */
	//显示前6页，超出6页末尾显示
	def ajaxPageTag = { attr ->
		
			int totalCount = attr.int('totalCount') ?: 0
			int offset = attr.int('offset') ?: 0
			int max = attr.int('max') ?: 0
			def onclickFun = attr['onclick']
			def requestUrl = attr['url']
			int currentPage = (offset / max) + 1
			int totalPage = (totalCount-1)/max+1//(totalCount % max)>0?(totalCount/max+1):(totalCount/max)
			def showPageNumStr = ""
			def prevPageTagStr = ""
			def nextPageTagStr = ""
			//上一页
			def styleTagStart = '<nav><ul class="pagination">'
			def styleTagEnd = '</ul></nav>'
			if(currentPage > 1){
				def prevOffset = (offset-max)<0?0:(offset-max)
				prevPageTagStr += "<li><a class='prev' href='javascript:;' onclick=\"${onclickFun}('${requestUrl}?offset=${prevOffset}&max=${max}')\"><< 上一页</a></li>"
			}
			//少于10
			if(totalPage <= 10){
				(1..totalPage).each {
					if(it == currentPage){
						showPageNumStr += "<li class='active'><a class='page current' href='javascript:;'>${it}</a></li>"
					}else{
						showPageNumStr += "<li><a class='page' href='javascript:;' onclick=\"${onclickFun}('${requestUrl}?offset=${(it-1)*max}&max=${max}')\">${it}</a></li>"
					}
				}
			}
			//大于10页
			if(totalPage > 10){
				if(currentPage <= 6){
					int startPage = 1
					int endPage = 6
//					if(currentPage == 6){
//						endPage = 6
//					}else{
//						endPage = 5
//					}
					(startPage..endPage).each {
						if(it == currentPage){
							showPageNumStr += "<li><a class='page current' href='javascript:;'>${it}</a></li>"
						}else{
							showPageNumStr += "<li><a class='page' href='javascript:;' onclick=\"${onclickFun}('${requestUrl}?offset=${(it-1)*max}&max=${max}')\">${it}</a></li>"
						}
					}
					showPageNumStr += "<li><a class='page' href='javascript:;'>...</a></li>"
				}else{
					(1..6).each {
						showPageNumStr += "<li><a class='page' href='javascript:;' onclick=\"${onclickFun}('${requestUrl}?offset=${(it-1)*max}&max=${max}')\">${it}</a></li>"
					}
					showPageNumStr += "<li><a class='page' href='javascript:;'>...</a></li>"
					showPageNumStr += "<li><a class='page current' href='javascript:;'>${currentPage}</a></li>"
				}
			}
			//下一页
			if(currentPage < totalPage){
				def nextOffset = (offset+max)>=totalCount?offset:(offset+max)
				nextPageTagStr += "<li><a class='next' href='javascript:;' onclick=\"${onclickFun}('${requestUrl}?offset=${nextOffset}&max=${max}')\">下一页 >></a></li>"
			}
//			def pageJumpTabStr = "<li><a class='toPage' href='javascript:;'>"+
//								"<li><input type='text' value='${currentPage}' id='toPageInput' data-max='${max}'/> /&nbsp;<i>${totalPage}</i>"+
//								"</a></li>"
			out << styleTagStart+prevPageTagStr+showPageNumStr+nextPageTagStr+styleTagEnd//+pageJumpTabStr
		}
}
