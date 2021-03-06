/'* \file pruw1_C_wrapper.bas
\brief The main source code of the C wrapper for libpruw1.

This file provides the libpruw1 functions in a C compatible syntax to
use it in polyglot applications and to create language bindings
for non-C languages.

Licence: LGPLv2 (http://www.gnu.org/licenses/lgpl-2.0.html)

Copyright 2015-\Year by Thomas{ dOt ]Freiherr[ At ]gmx[ DoT }net

\since 0.0
'/


' driver header file
#include ONCE "pruw1.bi"

'* \brief Wrapper function for constructor PruW1::PruW1().
FUNCTION pruw1_new CDECL ALIAS "pruw1_new"( _
  BYVAL P AS PruIo PTR, _
  BYVAL B AS Uint8) AS PruW1 PTR EXPORT

  RETURN NEW PruW1(P, B)
END FUNCTION

'* \brief Wrapper function for destructor PruW1::~PruW1.
SUB pruw1_destroy CDECL ALIAS "pruw1_destroy"( _
    BYVAL W1 AS PruW1 PTR) EXPORT

  IF W1 THEN DELETE W1
END SUB

'* \brief Wrapper function for PruW1::scanBus().
FUNCTION pruw1_scanBus CDECL ALIAS "pruw1_scanBus"( _
  BYVAL W1 AS PruW1 PTR, _
  BYVAL SearchType AS UInt8 = &hF0)AS ZSTRING PTR EXPORT

  RETURN W1->scanBus(SearchType)
END FUNCTION

'* \brief Wrapper function for PruW1::sendByte().
SUB pruw1_sendByte CDECL ALIAS "pruw1_sendByte"( _
  BYVAL W1 AS PruW1 PTR, _
  BYVAL V AS UInt8) EXPORT

  W1->sendByte(V)
END SUB

'* \brief Wrapper function for PruW1::sendByte().
SUB pruw1_sendRom CDECL ALIAS "pruw1_sendRom"( _
  BYVAL W1 AS PruW1 PTR, _
  BYVAL V AS ULONGINT) EXPORT

  W1->sendRom(V)
END SUB

'* \brief Wrapper function for PruW1::recvBlock().
FUNCTION pruw1_recvBlock CDECL ALIAS "pruw1_recvBlock"( _
  BYVAL W1 AS PruW1 PTR, _
  BYVAL N AS UInt8) AS UInt8 EXPORT

  RETURN W1->recvBlock(N)
END FUNCTION

'* \brief Wrapper function for PruW1::recvByte().
FUNCTION pruw1_recvByte CDECL ALIAS "pruw1_recvByte"( _
  BYVAL W1 AS PruW1 PTR) AS UInt8 EXPORT

  RETURN W1->recvByte()
END FUNCTION

'* \brief Wrapper function for PruW1::getIn().
FUNCTION pruw1_getIn CDECL ALIAS "pruw1_getIn"( _
  BYVAL W1 AS PruW1 PTR) AS UInt8 EXPORT

  RETURN W1->getIn()
END FUNCTION

'* \brief Wrapper function for PruW1::resetBus().
FUNCTION pruw1_resetBus CDECL ALIAS "pruw1_resetBus"( _
  BYVAL W1 AS PruW1 PTR) AS UInt8 EXPORT

  RETURN W1->resetBus()
END FUNCTION

'* \brief Wrapper function for PruW1::calcCrc().
FUNCTION pruw1_calcCrc CDECL ALIAS "pruw1_calcCrc"( _
  BYVAL W1 AS PruW1 PTR, _
  BYVAL N AS UInt8) AS UInt8 EXPORT

  RETURN W1->calcCrc(N)
END FUNCTION

'* \brief Property to get size of array PruW1::Slots from C.
FUNCTION pruw1_getSlotsSize CDECL ALIAS "pruw1_getSlotsSize"( _
  BYVAL W1 AS PruW1 PTR) AS LONG EXPORT

  RETURN UBOUND(W1->Slots)
END FUNCTION


'* \brief Function to empty the array PruW1::Slots from C.
SUB pruw1_eraseSlots CDECL ALIAS "pruw1_eraseSlots"( _
  BYVAL W1 AS PruW1 PTR) EXPORT

  REDIM W1->Slots(-1)
END SUB

