\encoding{UTF-8}
\name{get_book_notes}
\alias{get_book_notes}
\title{获取豆瓣图书的读书笔记}
\description{获取豆瓣图书的读书笔记.}
\usage{get_book_notes(bookid,n=100,verbose=TRUE,)}
\arguments{
  \item{bookid}{豆瓣书籍的id号,一串数字,如'20326626'}
  \item{n}{获取读书笔记的篇数,默认n=100}
  \item{verbose}{当\code{verbose=TRUE}时,显示函数的执行过程信息,\code{verbose=FALSE}时不显示,默认为\code{TRUE}.}
}
\value{ 一个列表(list), 包括:
  \item{book_title}{书籍名称}
  \item{notes_amount}{笔记文章总数}
  \item{notes_info}{一个data.frame,包含8列:
    \code{title}评论文章标题,
    \code{note}读书笔记内容,
    \code{time}读书笔记发表时间,
    \code{nickname}作者昵称,
    \code{rating}作者评分,
    \code{author_url}作者主页,
    \code{note_url}该笔记的主页,
    \code{note_comment_url}对该笔记的评论主页}
}
\note{若实际短评数小于n，则获取的是实际数，若实际数，则获取到的数量是\code{ceiling(n/10)*10}.} 
\author{
  <\email{qxde01@@gmail.com}>
}

\seealso{\code{\link{get_book_comments}}
}
\examples{
## http://book.douban.com/subject/1291204/annotation
\dontrun{get_book_notes(bookid='1291204',n=50)}
}
\keyword{note}
\keyword{douban}
