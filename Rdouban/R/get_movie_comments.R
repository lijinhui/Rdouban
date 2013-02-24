
get_movie_comments<-function(movieid,n=100,...){
    
  strurl=paste0('http://movie.douban.com/subject/',movieid,'/comments')
  pagetree <- htmlParse(getURL(strurl))
  title<- sapply(getNodeSet(pagetree, '//title'),xmlValue)
  comments_amount<-gsub('[^0-9]','',sapply(getNodeSet(pagetree, '//span[@class="fleft"]'),xmlValue)[1])
  comments_amount<-as.integer(comments_amount)
  cat('�ܹ�',comments_amount,'������...\n')
  
  pages=ceiling(min(comments_amount,n)/20)
  
  .get_comment<-function(pagetree){
    comments<-gsub('\n| ','',sapply(getNodeSet(pagetree, '//div[@class="comment"]//p'),xmlValue))
    useful<-sapply(getNodeSet(pagetree,'//div[@class="comment"]//span[@class="votes pr5"]'),xmlValue)
    comments_time<-sapply(getNodeSet(pagetree,'//div[@class="comment"]//span[@class="fleft ml8"]'),xmlValue)
    authornode<-getNodeSet(pagetree, '//div[@class="comment"]//span[@class="fleft"]//a')
    authors<-sapply(authornode,xmlValue)
    authors_url<-sapply(authornode,function(x) xmlGetAttr(x, "href"))
    
    #voteinfo<-getNodeSet(pagetree, '//div[@class="comment"]//h3//span[@title]')
    #voteinfo<-sapply(voteinfo,function(x) xmlGetAttr(x, "class"))
    #rating<-gsub('allstar| rating|0','',voteinfo[grep('rating',voteinfo)])
    cbind(comments,comments_time,useful,authors,authors_url)
  }
  
  short_comments<-.get_comment(pagetree)
  
  if(pages>1){
    for(pg in 2:pages){
      cat('Getting',(pg-1)*20+1,'--',pg*20,'comments...\n')
      strurl=paste0('http://movie.douban.com/subject/',movieid,'/comments?start=',(pg-1)*20+1,'&limit=20&sort=new_score')
      pagetree <- htmlParse(getURL(strurl))
      short_comments0<-.get_comment(pagetree)
      short_comments<-rbind(short_comments,short_comments0)
    }
  }
  
  list(title=title,
       comments_amount=comments_amount,
       short_comments=as.data.frame(short_comments))
}
#http://movie.douban.com/subject/5308265/comments
#x=get_movie_comments(movieid=5308265,n=70)
