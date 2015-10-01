# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from mva overlay; $

EAPI="5"

AUTOTOOLS_AUTORECONF=1

inherit git-r3 autotools-utils

DESCRIPTION="An IPv4/IPv6 Subnet Calculator"
HOMEPAGE="https://www.uni-due.de/~be0001/subnetcalc/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/dreibh/subnetcalc"


LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="colorgcc geoip"

DEPEND="
	colorgcc? ( dev-util/colorgcc )
	geoip? ( dev-libs/geoip )
"
RDEPEND="
	${DEPEND}
"

src_configure() {
   local myeconfargs=(
		$(use_enable colorgcc) \
		$(use_with   geoip)
   )
   autotools-utils_src_configure
}