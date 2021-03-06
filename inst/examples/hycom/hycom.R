
readhycom <- function(date, xlim = NULL, ylim = NULL, zlim = NULL) {
  date <- as.POSIXct(date, tz = "UTC")
  tind <- which.min(abs(time - date))
  xind <- c(1, length(lon))
  yind <- c(1, length(lat))
  zind <- c(1, length(depth))
  if (!is.null(xlim)) {
     xlim <- (xlim + 180) %% 180 + 180

    xind <- c(findInterval(xlim[1], lon), findInterval(xlim[2], lon))
    }
  if (!is.null(ylim)) yind <- c(findInterval(ylim[1], lat), findInterval(ylim[2], lat))
  if (!is.null(zlim)) zind <- c(findInterval(zlim[1], depth), findInterval(zlim[2], depth))
  
  a <- ncvar_get(nc, "water_temp", start = c(xind[1], yind[1], zind[1], tind[1]), count = c(diff(xind) + 1, diff(yind) + 1, diff(zind) + 1, 1))
  xx <- lon[xind[1]:xind[2]]
  yy <- lat[yind[1]:yind[2]]
  zz <- depth[zind[1]:zind[2]]
  rotate(flip(setZ(brick(a, xmn = min(xx), xmx = max(xx), ymn = min(yy), ymx = max(yy), transpose = TRUE, crs = "+proj=longlat +ellps=WGS84 +over"), zz), "y"))
  
 }
