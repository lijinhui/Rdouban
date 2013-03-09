get_movie_info<-function(movieid,...){
  strurl=paste0('http://movie.douban.com/subject/',movieid,'/')
  pagetree<-htmlParse(getURL(strurl))
  ##������Ϣ:���ݡ���Ա��
  #director <-sapply(getNodeSet(pagetree,'//div[@id="info"]//a[@rel="v:directedBy"]'),xmlValue)
  #stars <-sapply(getNodeSet(pagetree,'//div[@id="info"]//a[@rel="v:starring"]'),xmlValue)
  #genre <-sapply(getNodeSet(pagetree,'//div[@id="info"]//span[@property="v:genre"]'),xmlValue)
  #runtime<-sapply(getNodeSet(pagetree,'//div[@id="info"]//span[@property="v:runtime"]'),xmlValue)
  baseinfo<-sapply(getNodeSet(pagetree,'//div[@id="info"]'), xmlValue)
  baseinfo<-gsub('\n|       ','',baseinfo)
  ##������Ϣ
  votenode <- getNodeSet(pagetree, '//div[@id="interest_sectl"]')
  voteinfo<-sapply(votenode, xmlValue)
  voteinfo<-unlist(strsplit(gsub('\n','',voteinfo),' '))
  voteinfo<-voteinfo[nchar(voteinfo)>0]
  voteinfo[2]<-gsub('[^0-9]','',voteinfo[2])
  voteinfo<-as.numeric(gsub('%','',voteinfo))
  names(voteinfo)<-c('score','votes','stars5','stars4','stars3','stars2','stars1')
  voteinfo[3:7]<-voteinfo[3:7]/100
  ##the introduction of movie
  intronode <- getNodeSet(pagetree, '//span[@class="all hidden"]')
  if(length(intronode)==0)
    intronode <- getNodeSet(pagetree, '//span[@property="v:summary"]')
  introinfo<-sapply(intronode, xmlValue)
  
  ## ���ñ�ǩ 
  labels_amount <- sapply(getNodeSet(pagetree, '//div[@id="db-tags-section"]//h2'), xmlValue)
  labels_amount<-as.integer(gsub('[^0-9]','',labels_amount))
  labelinfo<-sapply(getNodeSet(pagetree, '//div[@id="db-tags-section"]//div'), xmlValue)
  labelinfo<-iconv(labelinfo,from='UTF-8',to='GB18030')
  labelinfo<-gsub("\x810\x842| ",'',labelinfo)
  labelinfo<-unlist(strsplit(labelinfo,' |\\(|\\)'))
  labels_name<-labelinfo[seq(1,length(labelinfo),2)]
  labels_freq<-labelinfo[seq(2,length(labelinfo),2)]
  ## ��Ӱ������������
  long_vote<-sapply(getNodeSet(pagetree, '//div[@class="vs-content"]//a'), xmlValue)
  if(length(long_vote>0)){
    long_vote<-long_vote[grep('[0-9]',long_vote)]
    long_vote<-unlist(strsplit(long_vote,'\\('))
    long_vote<-long_vote[grep('\\)',long_vote)]
    long_vote<-as.integer(gsub('[^0-9]','',long_vote))
    names(long_vote)<-c('stars5','stars4','stars3','stars2','stars1')
  }
  else long_vote<-NA
  #�����Ͷ���������
  short_comments<-gsub('[^0-9]','',sapply(getNodeSet(pagetree, '//a [@href="comments"]'), xmlValue))
  long_comments<-gsub('[^0-9]','',sapply(getNodeSet(pagetree, '//span[@property="v:count"]'), xmlValue))
  if(length(short_comments)==0)short_comments<-NA
  if(length(long_comments)==0)long_comments<-NA
  ##����
  audience<-sapply(getNodeSet(pagetree, '//div[@id]//p[@class="pl"]//a'), xmlValue)
  audience<-audience[-grep('\\(',audience)]
  audience<-as.integer(gsub('[^0-9]','',audience))
  names(audience)<-c('doings','collections','wishes')
  ##���ۻ���
  discussion<-sapply(getNodeSet(pagetree, '//h2[@style]'), xmlValue)
  discussion<-gsub('[^0-9]','',discussion)
  if(length(discussion)==0)discussion<-NA
  
  comments_amount<-as.integer(c(short_comments,long_comments,discussion))
  names(comments_amount)<-c('short_amount','long_amount','discussion_amoun')
  list(movie_base_info=baseinfo,
       raing=voteinfo,
       movie_intro=introinfo,
       labels_amount=labels_amount,
       labels=data.frame(labels_name=labels_name,labels_freq=labels_freq,stringsAsFactors=F),
       long_comment_votes=long_vote,
       comments_amount=comments_amount,
       audience=audience)
  
}
## get_movie_info(movieid=10527209)