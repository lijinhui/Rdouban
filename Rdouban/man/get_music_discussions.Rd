
\encoding{UTF-8}
\name{get_music_discussions}
\alias{get_music_discussions}
\title{��ȡ��������ר���Ļ�����������
}
\description{��ȡ��������ר���Ļ�����������.
}
\usage{
get_music_discussions(musicid,n=100,verbose=TRUE,...)
}

\arguments{
  \item{musicid}{��������ר����ID,��������ɵ��ַ���,��ͨ������ר���Ķ�����ҳ��ѯ.}
  \item{n}{��ȡ���������,Ĭ��n=100.}
  \item{verbose}{��\code{verbose=TRUE}ʱ,��ʾ������ִ�й�����Ϣ,\code{verbose=FALSE}ʱ����ʾ,Ĭ��Ϊ\code{TRUE}.}
}

\value{һ��data.frame,��7��:
  \item{title }{�������}
  \item{dicussion }{��������}
  \item{nickname }{��������������ǳ�}
  \item{time }{���ⷢ����ʱ��}
  \item{useful }{����Ϊ���õĴ���}
  \item{unuseful}{������Ϊ���õĴ���}
  \item{discussion_url }{������ַ}
  
}

\note{��ʵ�ʻ�����С��n,���ȡ����ʵ����,��ʵ��������n,���ȡ����������\code{ceiling(n/20)*20}.}

\author{
qxde01<\email{qxde01@@gmail.com}>
}


\seealso{
\code{\link{get_music_comments,get_music_reviews}}
}
\examples{
## http://music.douban.com/subject/3843530/discussion/
\dontrun{get_music_discussions(musicid=3843530,n=100)}
}

\keyword{discussion}