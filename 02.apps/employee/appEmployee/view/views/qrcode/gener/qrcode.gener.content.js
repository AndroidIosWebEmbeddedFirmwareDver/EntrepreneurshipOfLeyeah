import React, {PureComponent} from 'react'
import {
    Text,
    View,
    Alert,
    Image,
    Button,
    WebView,
    Platform,
    ScrollView,
    Dimensions,
    PixelRatio,
    StyleSheet,
    ActivityIndicator,
    TouchableOpacity,
} from 'react-native';


export default class QrcodeGenerContent {
    static gener_html_content = (meQrcodeValue, meQrcodeWidth, meQrcodeHeight) => {
        return ('<!DOCTYPE HTML>\n' +
            '<html lang="zh-CN">\n' +
            '<head>\n' +
            '    <meta charset="UTF-8"/>\n' +
            '    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1"/>\n' +
            '    <meta name="renderer" content="webkit"/>\n' +
            '    <meta name="viewport"\n' +
            '          content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>\n' +
            '    <title>Title</title>\n' +
            '</head>\n' +
            '<body>\n' +
            '<div id="qrcode"></div>\n' +
            '<script type="text/javascript">\n' +
            '    let QRCode;\n' +
            '\n' +
            '    (function () {\n' +
            '\n' +
            '        function QR8bitByte(data) {\n' +
            '            this.mode = QRMode.MODE_8BIT_BYTE;\n' +
            '            this.data = data;\n' +
            '            this.parsedData = [];\n' +
            '\n' +
            '            // Added to support UTF-8 Characters\n' +
            '            for (let i = 0, l = this.data.length; i < l; i++) {\n' +
            '                let byteArray = [];\n' +
            '                let code = this.data.charCodeAt(i);\n' +
            '\n' +
            '                if (code > 0x10000) {\n' +
            '                    byteArray[0] = 0xF0 | ((code & 0x1C0000) >>> 18);\n' +
            '                    byteArray[1] = 0x80 | ((code & 0x3F000) >>> 12);\n' +
            '                    byteArray[2] = 0x80 | ((code & 0xFC0) >>> 6);\n' +
            '                    byteArray[3] = 0x80 | (code & 0x3F);\n' +
            '                } else if (code > 0x800) {\n' +
            '                    byteArray[0] = 0xE0 | ((code & 0xF000) >>> 12);\n' +
            '                    byteArray[1] = 0x80 | ((code & 0xFC0) >>> 6);\n' +
            '                    byteArray[2] = 0x80 | (code & 0x3F);\n' +
            '                } else if (code > 0x80) {\n' +
            '                    byteArray[0] = 0xC0 | ((code & 0x7C0) >>> 6);\n' +
            '                    byteArray[1] = 0x80 | (code & 0x3F);\n' +
            '                } else {\n' +
            '                    byteArray[0] = code;\n' +
            '                }\n' +
            '\n' +
            '                this.parsedData.push(byteArray);\n' +
            '            }\n' +
            '\n' +
            '            this.parsedData = Array.prototype.concat.apply([], this.parsedData);\n' +
            '\n' +
            '            if (this.parsedData.length !== this.data.length) {\n' +
            '                this.parsedData.unshift(191);\n' +
            '                this.parsedData.unshift(187);\n' +
            '                this.parsedData.unshift(239);\n' +
            '            }\n' +
            '        }\n' +
            '\n' +
            '        QR8bitByte.prototype = {\n' +
            '            getLength: function (buffer) {\n' +
            '                return this.parsedData.length;\n' +
            '            },\n' +
            '            write: function (buffer) {\n' +
            '                for (let i = 0, l = this.parsedData.length; i < l; i++) {\n' +
            '                    buffer.put(this.parsedData[i], 8);\n' +
            '                }\n' +
            '            }\n' +
            '        };\n' +
            '\n' +
            '        function QRCodeModel(typeNumber, errorCorrectLevel) {\n' +
            '            this.typeNumber = typeNumber;\n' +
            '            this.errorCorrectLevel = errorCorrectLevel;\n' +
            '            this.modules = null;\n' +
            '            this.moduleCount = 0;\n' +
            '            this.dataCache = null;\n' +
            '            this.dataList = [];\n' +
            '        }\n' +
            '\n' +
            '        QRCodeModel.prototype = {\n' +
            '            addData: function (data) {\n' +
            '                let newData = new QR8bitByte(data);\n' +
            '                this.dataList.push(newData);\n' +
            '                this.dataCache = null;\n' +
            '            }, isDark: function (row, col) {\n' +
            '                if (row < 0 || this.moduleCount <= row || col < 0 || this.moduleCount <= col) {\n' +
            '                    throw new Error(row + "," + col);\n' +
            '                }\n' +
            '                return this.modules[row][col];\n' +
            '            }, getModuleCount: function () {\n' +
            '                return this.moduleCount;\n' +
            '            }, make: function () {\n' +
            '                this.makeImpl(false, this.getBestMaskPattern());\n' +
            '            }, makeImpl: function (test, maskPattern) {\n' +
            '                this.moduleCount = this.typeNumber * 4 + 17;\n' +
            '                this.modules = new Array(this.moduleCount);\n' +
            '                for (let row = 0; row < this.moduleCount; row++) {\n' +
            '                    this.modules[row] = new Array(this.moduleCount);\n' +
            '                    for (let col = 0; col < this.moduleCount; col++) {\n' +
            '                        this.modules[row][col] = null;\n' +
            '                    }\n' +
            '                }\n' +
            '                this.setupPositionProbePattern(0, 0);\n' +
            '                this.setupPositionProbePattern(this.moduleCount - 7, 0);\n' +
            '                this.setupPositionProbePattern(0, this.moduleCount - 7);\n' +
            '                this.setupPositionAdjustPattern();\n' +
            '                this.setupTimingPattern();\n' +
            '                this.setupTypeInfo(test, maskPattern);\n' +
            '                if (this.typeNumber >= 7) {\n' +
            '                    this.setupTypeNumber(test);\n' +
            '                }\n' +
            '                if (this.dataCache === null) {\n' +
            '                    this.dataCache = QRCodeModel.createData(this.typeNumber, this.errorCorrectLevel, this.dataList);\n' +
            '                }\n' +
            '                this.mapData(this.dataCache, maskPattern);\n' +
            '            }, setupPositionProbePattern: function (row, col) {\n' +
            '                for (let r = -1; r <= 7; r++) {\n' +
            '                    if (row + r <= -1 || this.moduleCount <= row + r) continue;\n' +
            '                    for (let c = -1; c <= 7; c++) {\n' +
            '                        if (col + c <= -1 || this.moduleCount <= col + c) continue;\n' +
            '                        this.modules[row + r][col + c] = (0 <= r && r <= 6 && (c === 0 || c === 6)) || (0 <= c && c <= 6 && (r === 0 || r === 6)) || (2 <= r && r <= 4 && 2 <= c && c <= 4);\n' +
            '                    }\n' +
            '                }\n' +
            '            }, getBestMaskPattern: function () {\n' +
            '                let minLostPoint = 0;\n' +
            '                let pattern = 0;\n' +
            '                for (let i = 0; i < 8; i++) {\n' +
            '                    this.makeImpl(true, i);\n' +
            '                    let lostPoint = QRUtil.getLostPoint(this);\n' +
            '                    if (i === 0 || minLostPoint > lostPoint) {\n' +
            '                        minLostPoint = lostPoint;\n' +
            '                        pattern = i;\n' +
            '                    }\n' +
            '                }\n' +
            '                return pattern;\n' +
            '            }, createMovieClip: function (target_mc, instance_name, depth) {\n' +
            '                let qr_mc = target_mc.createEmptyMovieClip(instance_name, depth);\n' +
            '                let cs = 1;\n' +
            '                this.make();\n' +
            '                for (let row = 0; row < this.modules.length; row++) {\n' +
            '                    let y = row * cs;\n' +
            '                    for (let col = 0; col < this.modules[row].length; col++) {\n' +
            '                        let x = col * cs;\n' +
            '                        let dark = this.modules[row][col];\n' +
            '                        if (dark) {\n' +
            '                            qr_mc.beginFill(0, 100);\n' +
            '                            qr_mc.moveTo(x, y);\n' +
            '                            qr_mc.lineTo(x + cs, y);\n' +
            '                            qr_mc.lineTo(x + cs, y + cs);\n' +
            '                            qr_mc.lineTo(x, y + cs);\n' +
            '                            qr_mc.endFill();\n' +
            '                        }\n' +
            '                    }\n' +
            '                }\n' +
            '                return qr_mc;\n' +
            '            }, setupTimingPattern: function () {\n' +
            '                for (let r = 8; r < this.moduleCount - 8; r++) {\n' +
            '                    if (this.modules[r][6] !== null) {\n' +
            '                        continue;\n' +
            '                    }\n' +
            '                    this.modules[r][6] = (r % 2 === 0);\n' +
            '                }\n' +
            '                for (let c = 8; c < this.moduleCount - 8; c++) {\n' +
            '                    if (this.modules[6][c] !== null) {\n' +
            '                        continue;\n' +
            '                    }\n' +
            '                    this.modules[6][c] = (c % 2 === 0);\n' +
            '                }\n' +
            '            }, setupPositionAdjustPattern: function () {\n' +
            '                let pos = QRUtil.getPatternPosition(this.typeNumber);\n' +
            '                for (let i = 0; i < pos.length; i++) {\n' +
            '                    for (let j = 0; j < pos.length; j++) {\n' +
            '                        let row = pos[i];\n' +
            '                        let col = pos[j];\n' +
            '                        if (this.modules[row][col] !== null) {\n' +
            '                            continue;\n' +
            '                        }\n' +
            '                        for (let r = -2; r <= 2; r++) {\n' +
            '                            for (let c = -2; c <= 2; c++) {\n' +
            '                                this.modules[row + r][col + c] = r === -2 || r === 2 || c === -2 || c === 2 || (r === 0 && c === 0);\n' +
            '                            }\n' +
            '                        }\n' +
            '                    }\n' +
            '                }\n' +
            '            }, setupTypeNumber: function (test) {\n' +
            '                let bits = QRUtil.getBCHTypeNumber(this.typeNumber);\n' +
            '                for (let i = 0; i < 18; i++) {\n' +
            '                    let mod = (!test && ((bits >> i) & 1) === 1);\n' +
            '                    this.modules[Math.floor(i / 3)][i % 3 + this.moduleCount - 8 - 3] = mod;\n' +
            '                }\n' +
            '                for (let i = 0; i < 18; i++) {\n' +
            '                    let mod = (!test && ((bits >> i) & 1) === 1);\n' +
            '                    this.modules[i % 3 + this.moduleCount - 8 - 3][Math.floor(i / 3)] = mod;\n' +
            '                }\n' +
            '            }, setupTypeInfo: function (test, maskPattern) {\n' +
            '                let data = (this.errorCorrectLevel << 3) | maskPattern;\n' +
            '                let bits = QRUtil.getBCHTypeInfo(data);\n' +
            '                for (let i = 0; i < 15; i++) {\n' +
            '                    let mod = (!test && ((bits >> i) & 1) === 1);\n' +
            '                    if (i < 6) {\n' +
            '                        this.modules[i][8] = mod;\n' +
            '                    } else if (i < 8) {\n' +
            '                        this.modules[i + 1][8] = mod;\n' +
            '                    } else {\n' +
            '                        this.modules[this.moduleCount - 15 + i][8] = mod;\n' +
            '                    }\n' +
            '                }\n' +
            '                for (let i = 0; i < 15; i++) {\n' +
            '                    let mod = (!test && ((bits >> i) & 1) === 1);\n' +
            '                    if (i < 8) {\n' +
            '                        this.modules[8][this.moduleCount - i - 1] = mod;\n' +
            '                    } else if (i < 9) {\n' +
            '                        this.modules[8][15 - i - 1 + 1] = mod;\n' +
            '                    } else {\n' +
            '                        this.modules[8][15 - i - 1] = mod;\n' +
            '                    }\n' +
            '                }\n' +
            '                this.modules[this.moduleCount - 8][8] = (!test);\n' +
            '            }, mapData: function (data, maskPattern) {\n' +
            '                let inc = -1;\n' +
            '                let row = this.moduleCount - 1;\n' +
            '                let bitIndex = 7;\n' +
            '                let byteIndex = 0;\n' +
            '                for (let col = this.moduleCount - 1; col > 0; col -= 2) {\n' +
            '                    if (col === 6) col--;\n' +
            '                    while (true) {\n' +
            '                        for (let c = 0; c < 2; c++) {\n' +
            '                            if (this.modules[row][col - c] === null) {\n' +
            '                                let dark = false;\n' +
            '                                if (byteIndex < data.length) {\n' +
            '                                    dark = (((data[byteIndex] >>> bitIndex) & 1) === 1);\n' +
            '                                }\n' +
            '                                let mask = QRUtil.getMask(maskPattern, row, col - c);\n' +
            '                                if (mask) {\n' +
            '                                    dark = !dark;\n' +
            '                                }\n' +
            '                                this.modules[row][col - c] = dark;\n' +
            '                                bitIndex--;\n' +
            '                                if (bitIndex === -1) {\n' +
            '                                    byteIndex++;\n' +
            '                                    bitIndex = 7;\n' +
            '                                }\n' +
            '                            }\n' +
            '                        }\n' +
            '                        row += inc;\n' +
            '                        if (row < 0 || this.moduleCount <= row) {\n' +
            '                            row -= inc;\n' +
            '                            inc = -inc;\n' +
            '                            break;\n' +
            '                        }\n' +
            '                    }\n' +
            '                }\n' +
            '            }\n' +
            '        };\n' +
            '        QRCodeModel.PAD0 = 0xEC;\n' +
            '        QRCodeModel.PAD1 = 0x11;\n' +
            '        QRCodeModel.createData = function (typeNumber, errorCorrectLevel, dataList) {\n' +
            '            let rsBlocks = QRRSBlock.getRSBlocks(typeNumber, errorCorrectLevel);\n' +
            '            let buffer = new QRBitBuffer();\n' +
            '            for (let i = 0; i < dataList.length; i++) {\n' +
            '                let data = dataList[i];\n' +
            '                buffer.put(data.mode, 4);\n' +
            '                buffer.put(data.getLength(), QRUtil.getLengthInBits(data.mode, typeNumber));\n' +
            '                data.write(buffer);\n' +
            '            }\n' +
            '            let totalDataCount = 0;\n' +
            '            for (let i = 0; i < rsBlocks.length; i++) {\n' +
            '                totalDataCount += rsBlocks[i].dataCount;\n' +
            '            }\n' +
            '            if (buffer.getLengthInBits() > totalDataCount * 8) {\n' +
            '                throw new Error("code length overflow. ("\n' +
            '                    + buffer.getLengthInBits()\n' +
            '                    + ">"\n' +
            '                    + totalDataCount * 8\n' +
            '                    + ")");\n' +
            '            }\n' +
            '            if (buffer.getLengthInBits() + 4 <= totalDataCount * 8) {\n' +
            '                buffer.put(0, 4);\n' +
            '            }\n' +
            '            while (buffer.getLengthInBits() % 8 !== 0) {\n' +
            '                buffer.putBit(false);\n' +
            '            }\n' +
            '            while (true) {\n' +
            '                if (buffer.getLengthInBits() >= totalDataCount * 8) {\n' +
            '                    break;\n' +
            '                }\n' +
            '                buffer.put(QRCodeModel.PAD0, 8);\n' +
            '                if (buffer.getLengthInBits() >= totalDataCount * 8) {\n' +
            '                    break;\n' +
            '                }\n' +
            '                buffer.put(QRCodeModel.PAD1, 8);\n' +
            '            }\n' +
            '            return QRCodeModel.createBytes(buffer, rsBlocks);\n' +
            '        };\n' +
            '        QRCodeModel.createBytes = function (buffer, rsBlocks) {\n' +
            '            let offset = 0;\n' +
            '            let maxDcCount = 0;\n' +
            '            let maxEcCount = 0;\n' +
            '            let dcdata = new Array(rsBlocks.length);\n' +
            '            let ecdata = new Array(rsBlocks.length);\n' +
            '            for (let r = 0; r < rsBlocks.length; r++) {\n' +
            '                let dcCount = rsBlocks[r].dataCount;\n' +
            '                let ecCount = rsBlocks[r].totalCount - dcCount;\n' +
            '                maxDcCount = Math.max(maxDcCount, dcCount);\n' +
            '                maxEcCount = Math.max(maxEcCount, ecCount);\n' +
            '                dcdata[r] = new Array(dcCount);\n' +
            '                for (let i = 0; i < dcdata[r].length; i++) {\n' +
            '                    dcdata[r][i] = 0xff & buffer.buffer[i + offset];\n' +
            '                }\n' +
            '                offset += dcCount;\n' +
            '                let rsPoly = QRUtil.getErrorCorrectPolynomial(ecCount);\n' +
            '                let rawPoly = new QRPolynomial(dcdata[r], rsPoly.getLength() - 1);\n' +
            '                let modPoly = rawPoly.mod(rsPoly);\n' +
            '                ecdata[r] = new Array(rsPoly.getLength() - 1);\n' +
            '                for (let i = 0; i < ecdata[r].length; i++) {\n' +
            '                    let modIndex = i + modPoly.getLength() - ecdata[r].length;\n' +
            '                    ecdata[r][i] = (modIndex >= 0) ? modPoly.get(modIndex) : 0;\n' +
            '                }\n' +
            '            }\n' +
            '            let totalCodeCount = 0;\n' +
            '            for (let i = 0; i < rsBlocks.length; i++) {\n' +
            '                totalCodeCount += rsBlocks[i].totalCount;\n' +
            '            }\n' +
            '            let data = new Array(totalCodeCount);\n' +
            '            let index = 0;\n' +
            '            for (let i = 0; i < maxDcCount; i++) {\n' +
            '                for (let r = 0; r < rsBlocks.length; r++) {\n' +
            '                    if (i < dcdata[r].length) {\n' +
            '                        data[index++] = dcdata[r][i];\n' +
            '                    }\n' +
            '                }\n' +
            '            }\n' +
            '            for (let i = 0; i < maxEcCount; i++) {\n' +
            '                for (let r = 0; r < rsBlocks.length; r++) {\n' +
            '                    if (i < ecdata[r].length) {\n' +
            '                        data[index++] = ecdata[r][i];\n' +
            '                    }\n' +
            '                }\n' +
            '            }\n' +
            '            return data;\n' +
            '        };\n' +
            '        let QRMode = {\n' +
            '            MODE_NUMBER: 1 << 0,\n' +
            '            MODE_ALPHA_NUM: 1 << 1,\n' +
            '            MODE_8BIT_BYTE: 1 << 2,\n' +
            '            MODE_KANJI: 1 << 3\n' +
            '        };\n' +
            '        let QRErrorCorrectLevel = {L: 1, M: 0, Q: 3, H: 2};\n' +
            '        let QRMaskPattern = {\n' +
            '            PATTERN000: 0,\n' +
            '            PATTERN001: 1,\n' +
            '            PATTERN010: 2,\n' +
            '            PATTERN011: 3,\n' +
            '            PATTERN100: 4,\n' +
            '            PATTERN101: 5,\n' +
            '            PATTERN110: 6,\n' +
            '            PATTERN111: 7\n' +
            '        };\n' +
            '        let QRUtil = {\n' +
            '            PATTERN_POSITION_TABLE: [[], [6, 18], [6, 22], [6, 26], [6, 30], [6, 34], [6, 22, 38], [6, 24, 42], [6, 26, 46], [6, 28, 50], [6, 30, 54], [6, 32, 58], [6, 34, 62], [6, 26, 46, 66], [6, 26, 48, 70], [6, 26, 50, 74], [6, 30, 54, 78], [6, 30, 56, 82], [6, 30, 58, 86], [6, 34, 62, 90], [6, 28, 50, 72, 94], [6, 26, 50, 74, 98], [6, 30, 54, 78, 102], [6, 28, 54, 80, 106], [6, 32, 58, 84, 110], [6, 30, 58, 86, 114], [6, 34, 62, 90, 118], [6, 26, 50, 74, 98, 122], [6, 30, 54, 78, 102, 126], [6, 26, 52, 78, 104, 130], [6, 30, 56, 82, 108, 134], [6, 34, 60, 86, 112, 138], [6, 30, 58, 86, 114, 142], [6, 34, 62, 90, 118, 146], [6, 30, 54, 78, 102, 126, 150], [6, 24, 50, 76, 102, 128, 154], [6, 28, 54, 80, 106, 132, 158], [6, 32, 58, 84, 110, 136, 162], [6, 26, 54, 82, 110, 138, 166], [6, 30, 58, 86, 114, 142, 170]],\n' +
            '            G15: (1 << 10) | (1 << 8) | (1 << 5) | (1 << 4) | (1 << 2) | (1 << 1) | (1 << 0),\n' +
            '            G18: (1 << 12) | (1 << 11) | (1 << 10) | (1 << 9) | (1 << 8) | (1 << 5) | (1 << 2) | (1 << 0),\n' +
            '            G15_MASK: (1 << 14) | (1 << 12) | (1 << 10) | (1 << 4) | (1 << 1),\n' +
            '            getBCHTypeInfo: function (data) {\n' +
            '                let d = data << 10;\n' +
            '                while (QRUtil.getBCHDigit(d) - QRUtil.getBCHDigit(QRUtil.G15) >= 0) {\n' +
            '                    d ^= (QRUtil.G15 << (QRUtil.getBCHDigit(d) - QRUtil.getBCHDigit(QRUtil.G15)));\n' +
            '                }\n' +
            '                return ((data << 10) | d) ^ QRUtil.G15_MASK;\n' +
            '            },\n' +
            '            getBCHTypeNumber: function (data) {\n' +
            '                let d = data << 12;\n' +
            '                while (QRUtil.getBCHDigit(d) - QRUtil.getBCHDigit(QRUtil.G18) >= 0) {\n' +
            '                    d ^= (QRUtil.G18 << (QRUtil.getBCHDigit(d) - QRUtil.getBCHDigit(QRUtil.G18)));\n' +
            '                }\n' +
            '                return (data << 12) | d;\n' +
            '            },\n' +
            '            getBCHDigit: function (data) {\n' +
            '                let digit = 0;\n' +
            '                while (data !== 0) {\n' +
            '                    digit++;\n' +
            '                    data >>>= 1;\n' +
            '                }\n' +
            '                return digit;\n' +
            '            },\n' +
            '            getPatternPosition: function (typeNumber) {\n' +
            '                return QRUtil.PATTERN_POSITION_TABLE[typeNumber - 1];\n' +
            '            },\n' +
            '            getMask: function (maskPattern, i, j) {\n' +
            '                switch (maskPattern) {\n' +
            '                    case QRMaskPattern.PATTERN000:\n' +
            '                        return (i + j) % 2 === 0;\n' +
            '                    case QRMaskPattern.PATTERN001:\n' +
            '                        return i % 2 === 0;\n' +
            '                    case QRMaskPattern.PATTERN010:\n' +
            '                        return j % 3 === 0;\n' +
            '                    case QRMaskPattern.PATTERN011:\n' +
            '                        return (i + j) % 3 === 0;\n' +
            '                    case QRMaskPattern.PATTERN100:\n' +
            '                        return (Math.floor(i / 2) + Math.floor(j / 3)) % 2 === 0;\n' +
            '                    case QRMaskPattern.PATTERN101:\n' +
            '                        return (i * j) % 2 + (i * j) % 3 === 0;\n' +
            '                    case QRMaskPattern.PATTERN110:\n' +
            '                        return ((i * j) % 2 + (i * j) % 3) % 2 === 0;\n' +
            '                    case QRMaskPattern.PATTERN111:\n' +
            '                        return ((i * j) % 3 + (i + j) % 2) % 2 === 0;\n' +
            '                    default:\n' +
            '                        throw new Error("bad maskPattern:" + maskPattern);\n' +
            '                }\n' +
            '            },\n' +
            '            getErrorCorrectPolynomial: function (errorCorrectLength) {\n' +
            '                let a = new QRPolynomial([1], 0);\n' +
            '                for (let i = 0; i < errorCorrectLength; i++) {\n' +
            '                    a = a.multiply(new QRPolynomial([1, QRMath.gexp(i)], 0));\n' +
            '                }\n' +
            '                return a;\n' +
            '            },\n' +
            '            getLengthInBits: function (mode, type) {\n' +
            '                if (1 <= type && type < 10) {\n' +
            '                    switch (mode) {\n' +
            '                        case QRMode.MODE_NUMBER:\n' +
            '                            return 10;\n' +
            '                        case QRMode.MODE_ALPHA_NUM:\n' +
            '                            return 9;\n' +
            '                        case QRMode.MODE_8BIT_BYTE:\n' +
            '                            return 8;\n' +
            '                        case QRMode.MODE_KANJI:\n' +
            '                            return 8;\n' +
            '                        default:\n' +
            '                            throw new Error("mode:" + mode);\n' +
            '                    }\n' +
            '                } else if (type < 27) {\n' +
            '                    switch (mode) {\n' +
            '                        case QRMode.MODE_NUMBER:\n' +
            '                            return 12;\n' +
            '                        case QRMode.MODE_ALPHA_NUM:\n' +
            '                            return 11;\n' +
            '                        case QRMode.MODE_8BIT_BYTE:\n' +
            '                            return 16;\n' +
            '                        case QRMode.MODE_KANJI:\n' +
            '                            return 10;\n' +
            '                        default:\n' +
            '                            throw new Error("mode:" + mode);\n' +
            '                    }\n' +
            '                } else if (type < 41) {\n' +
            '                    switch (mode) {\n' +
            '                        case QRMode.MODE_NUMBER:\n' +
            '                            return 14;\n' +
            '                        case QRMode.MODE_ALPHA_NUM:\n' +
            '                            return 13;\n' +
            '                        case QRMode.MODE_8BIT_BYTE:\n' +
            '                            return 16;\n' +
            '                        case QRMode.MODE_KANJI:\n' +
            '                            return 12;\n' +
            '                        default:\n' +
            '                            throw new Error("mode:" + mode);\n' +
            '                    }\n' +
            '                } else {\n' +
            '                    throw new Error("type:" + type);\n' +
            '                }\n' +
            '            },\n' +
            '            getLostPoint: function (qrCode) {\n' +
            '                let moduleCount = qrCode.getModuleCount();\n' +
            '                let lostPoint = 0;\n' +
            '                for (let row = 0; row < moduleCount; row++) {\n' +
            '                    for (let col = 0; col < moduleCount; col++) {\n' +
            '                        let sameCount = 0;\n' +
            '                        let dark = qrCode.isDark(row, col);\n' +
            '                        for (let r = -1; r <= 1; r++) {\n' +
            '                            if (row + r < 0 || moduleCount <= row + r) {\n' +
            '                                continue;\n' +
            '                            }\n' +
            '                            for (let c = -1; c <= 1; c++) {\n' +
            '                                if (col + c < 0 || moduleCount <= col + c) {\n' +
            '                                    continue;\n' +
            '                                }\n' +
            '                                if (r === 0 && c === 0) {\n' +
            '                                    continue;\n' +
            '                                }\n' +
            '                                if (dark === qrCode.isDark(row + r, col + c)) {\n' +
            '                                    sameCount++;\n' +
            '                                }\n' +
            '                            }\n' +
            '                        }\n' +
            '                        if (sameCount > 5) {\n' +
            '                            lostPoint += (3 + sameCount - 5);\n' +
            '                        }\n' +
            '                    }\n' +
            '                }\n' +
            '                for (let row = 0; row < moduleCount - 1; row++) {\n' +
            '                    for (let col = 0; col < moduleCount - 1; col++) {\n' +
            '                        let count = 0;\n' +
            '                        if (qrCode.isDark(row, col)) count++;\n' +
            '                        if (qrCode.isDark(row + 1, col)) count++;\n' +
            '                        if (qrCode.isDark(row, col + 1)) count++;\n' +
            '                        if (qrCode.isDark(row + 1, col + 1)) count++;\n' +
            '                        if (count === 0 || count === 4) {\n' +
            '                            lostPoint += 3;\n' +
            '                        }\n' +
            '                    }\n' +
            '                }\n' +
            '                for (let row = 0; row < moduleCount; row++) {\n' +
            '                    for (let col = 0; col < moduleCount - 6; col++) {\n' +
            '                        if (qrCode.isDark(row, col) && !qrCode.isDark(row, col + 1) && qrCode.isDark(row, col + 2) && qrCode.isDark(row, col + 3) && qrCode.isDark(row, col + 4) && !qrCode.isDark(row, col + 5) && qrCode.isDark(row, col + 6)) {\n' +
            '                            lostPoint += 40;\n' +
            '                        }\n' +
            '                    }\n' +
            '                }\n' +
            '                for (let col = 0; col < moduleCount; col++) {\n' +
            '                    for (let row = 0; row < moduleCount - 6; row++) {\n' +
            '                        if (qrCode.isDark(row, col) && !qrCode.isDark(row + 1, col) && qrCode.isDark(row + 2, col) && qrCode.isDark(row + 3, col) && qrCode.isDark(row + 4, col) && !qrCode.isDark(row + 5, col) && qrCode.isDark(row + 6, col)) {\n' +
            '                            lostPoint += 40;\n' +
            '                        }\n' +
            '                    }\n' +
            '                }\n' +
            '                let darkCount = 0;\n' +
            '                for (let col = 0; col < moduleCount; col++) {\n' +
            '                    for (let row = 0; row < moduleCount; row++) {\n' +
            '                        if (qrCode.isDark(row, col)) {\n' +
            '                            darkCount++;\n' +
            '                        }\n' +
            '                    }\n' +
            '                }\n' +
            '                let ratio = Math.abs(100 * darkCount / moduleCount / moduleCount - 50) / 5;\n' +
            '                lostPoint += ratio * 10;\n' +
            '                return lostPoint;\n' +
            '            }\n' +
            '        };\n' +
            '        let QRMath = {\n' +
            '            glog: function (n) {\n' +
            '                if (n < 1) {\n' +
            '                    throw new Error("glog(" + n + ")");\n' +
            '                }\n' +
            '                return QRMath.LOG_TABLE[n];\n' +
            '            }, gexp: function (n) {\n' +
            '                while (n < 0) {\n' +
            '                    n += 255;\n' +
            '                }\n' +
            '                while (n >= 256) {\n' +
            '                    n -= 255;\n' +
            '                }\n' +
            '                return QRMath.EXP_TABLE[n];\n' +
            '            }, EXP_TABLE: new Array(256), LOG_TABLE: new Array(256)\n' +
            '        };\n' +
            '        for (let i = 0; i < 8; i++) {\n' +
            '            QRMath.EXP_TABLE[i] = 1 << i;\n' +
            '        }\n' +
            '        for (let i = 8; i < 256; i++) {\n' +
            '            QRMath.EXP_TABLE[i] = QRMath.EXP_TABLE[i - 4] ^ QRMath.EXP_TABLE[i - 5] ^ QRMath.EXP_TABLE[i - 6] ^ QRMath.EXP_TABLE[i - 8];\n' +
            '        }\n' +
            '        for (let i = 0; i < 255; i++) {\n' +
            '            QRMath.LOG_TABLE[QRMath.EXP_TABLE[i]] = i;\n' +
            '        }\n' +
            '\n' +
            '        function QRPolynomial(num, shift) {\n' +
            '            if (num.length === undefined) {\n' +
            '                throw new Error(num.length + "/" + shift);\n' +
            '            }\n' +
            '            let offset = 0;\n' +
            '            while (offset < num.length && num[offset] === 0) {\n' +
            '                offset++;\n' +
            '            }\n' +
            '            this.num = new Array(num.length - offset + shift);\n' +
            '            for (let i = 0; i < num.length - offset; i++) {\n' +
            '                this.num[i] = num[i + offset];\n' +
            '            }\n' +
            '        }\n' +
            '\n' +
            '        QRPolynomial.prototype = {\n' +
            '            get: function (index) {\n' +
            '                return this.num[index];\n' +
            '            }, getLength: function () {\n' +
            '                return this.num.length;\n' +
            '            }, multiply: function (e) {\n' +
            '                let num = new Array(this.getLength() + e.getLength() - 1);\n' +
            '                for (let i = 0; i < this.getLength(); i++) {\n' +
            '                    for (let j = 0; j < e.getLength(); j++) {\n' +
            '                        num[i + j] ^= QRMath.gexp(QRMath.glog(this.get(i)) + QRMath.glog(e.get(j)));\n' +
            '                    }\n' +
            '                }\n' +
            '                return new QRPolynomial(num, 0);\n' +
            '            }, mod: function (e) {\n' +
            '                if (this.getLength() - e.getLength() < 0) {\n' +
            '                    return this;\n' +
            '                }\n' +
            '                let ratio = QRMath.glog(this.get(0)) - QRMath.glog(e.get(0));\n' +
            '                let num = new Array(this.getLength());\n' +
            '                for (let i = 0; i < this.getLength(); i++) {\n' +
            '                    num[i] = this.get(i);\n' +
            '                }\n' +
            '                for (let i = 0; i < e.getLength(); i++) {\n' +
            '                    num[i] ^= QRMath.gexp(QRMath.glog(e.get(i)) + ratio);\n' +
            '                }\n' +
            '                return new QRPolynomial(num, 0).mod(e);\n' +
            '            }\n' +
            '        };\n' +
            '\n' +
            '        function QRRSBlock(totalCount, dataCount) {\n' +
            '            this.totalCount = totalCount;\n' +
            '            this.dataCount = dataCount;\n' +
            '        }\n' +
            '\n' +
            '        QRRSBlock.RS_BLOCK_TABLE = [[1, 26, 19], [1, 26, 16], [1, 26, 13], [1, 26, 9], [1, 44, 34], [1, 44, 28], [1, 44, 22], [1, 44, 16], [1, 70, 55], [1, 70, 44], [2, 35, 17], [2, 35, 13], [1, 100, 80], [2, 50, 32], [2, 50, 24], [4, 25, 9], [1, 134, 108], [2, 67, 43], [2, 33, 15, 2, 34, 16], [2, 33, 11, 2, 34, 12], [2, 86, 68], [4, 43, 27], [4, 43, 19], [4, 43, 15], [2, 98, 78], [4, 49, 31], [2, 32, 14, 4, 33, 15], [4, 39, 13, 1, 40, 14], [2, 121, 97], [2, 60, 38, 2, 61, 39], [4, 40, 18, 2, 41, 19], [4, 40, 14, 2, 41, 15], [2, 146, 116], [3, 58, 36, 2, 59, 37], [4, 36, 16, 4, 37, 17], [4, 36, 12, 4, 37, 13], [2, 86, 68, 2, 87, 69], [4, 69, 43, 1, 70, 44], [6, 43, 19, 2, 44, 20], [6, 43, 15, 2, 44, 16], [4, 101, 81], [1, 80, 50, 4, 81, 51], [4, 50, 22, 4, 51, 23], [3, 36, 12, 8, 37, 13], [2, 116, 92, 2, 117, 93], [6, 58, 36, 2, 59, 37], [4, 46, 20, 6, 47, 21], [7, 42, 14, 4, 43, 15], [4, 133, 107], [8, 59, 37, 1, 60, 38], [8, 44, 20, 4, 45, 21], [12, 33, 11, 4, 34, 12], [3, 145, 115, 1, 146, 116], [4, 64, 40, 5, 65, 41], [11, 36, 16, 5, 37, 17], [11, 36, 12, 5, 37, 13], [5, 109, 87, 1, 110, 88], [5, 65, 41, 5, 66, 42], [5, 54, 24, 7, 55, 25], [11, 36, 12], [5, 122, 98, 1, 123, 99], [7, 73, 45, 3, 74, 46], [15, 43, 19, 2, 44, 20], [3, 45, 15, 13, 46, 16], [1, 135, 107, 5, 136, 108], [10, 74, 46, 1, 75, 47], [1, 50, 22, 15, 51, 23], [2, 42, 14, 17, 43, 15], [5, 150, 120, 1, 151, 121], [9, 69, 43, 4, 70, 44], [17, 50, 22, 1, 51, 23], [2, 42, 14, 19, 43, 15], [3, 141, 113, 4, 142, 114], [3, 70, 44, 11, 71, 45], [17, 47, 21, 4, 48, 22], [9, 39, 13, 16, 40, 14], [3, 135, 107, 5, 136, 108], [3, 67, 41, 13, 68, 42], [15, 54, 24, 5, 55, 25], [15, 43, 15, 10, 44, 16], [4, 144, 116, 4, 145, 117], [17, 68, 42], [17, 50, 22, 6, 51, 23], [19, 46, 16, 6, 47, 17], [2, 139, 111, 7, 140, 112], [17, 74, 46], [7, 54, 24, 16, 55, 25], [34, 37, 13], [4, 151, 121, 5, 152, 122], [4, 75, 47, 14, 76, 48], [11, 54, 24, 14, 55, 25], [16, 45, 15, 14, 46, 16], [6, 147, 117, 4, 148, 118], [6, 73, 45, 14, 74, 46], [11, 54, 24, 16, 55, 25], [30, 46, 16, 2, 47, 17], [8, 132, 106, 4, 133, 107], [8, 75, 47, 13, 76, 48], [7, 54, 24, 22, 55, 25], [22, 45, 15, 13, 46, 16], [10, 142, 114, 2, 143, 115], [19, 74, 46, 4, 75, 47], [28, 50, 22, 6, 51, 23], [33, 46, 16, 4, 47, 17], [8, 152, 122, 4, 153, 123], [22, 73, 45, 3, 74, 46], [8, 53, 23, 26, 54, 24], [12, 45, 15, 28, 46, 16], [3, 147, 117, 10, 148, 118], [3, 73, 45, 23, 74, 46], [4, 54, 24, 31, 55, 25], [11, 45, 15, 31, 46, 16], [7, 146, 116, 7, 147, 117], [21, 73, 45, 7, 74, 46], [1, 53, 23, 37, 54, 24], [19, 45, 15, 26, 46, 16], [5, 145, 115, 10, 146, 116], [19, 75, 47, 10, 76, 48], [15, 54, 24, 25, 55, 25], [23, 45, 15, 25, 46, 16], [13, 145, 115, 3, 146, 116], [2, 74, 46, 29, 75, 47], [42, 54, 24, 1, 55, 25], [23, 45, 15, 28, 46, 16], [17, 145, 115], [10, 74, 46, 23, 75, 47], [10, 54, 24, 35, 55, 25], [19, 45, 15, 35, 46, 16], [17, 145, 115, 1, 146, 116], [14, 74, 46, 21, 75, 47], [29, 54, 24, 19, 55, 25], [11, 45, 15, 46, 46, 16], [13, 145, 115, 6, 146, 116], [14, 74, 46, 23, 75, 47], [44, 54, 24, 7, 55, 25], [59, 46, 16, 1, 47, 17], [12, 151, 121, 7, 152, 122], [12, 75, 47, 26, 76, 48], [39, 54, 24, 14, 55, 25], [22, 45, 15, 41, 46, 16], [6, 151, 121, 14, 152, 122], [6, 75, 47, 34, 76, 48], [46, 54, 24, 10, 55, 25], [2, 45, 15, 64, 46, 16], [17, 152, 122, 4, 153, 123], [29, 74, 46, 14, 75, 47], [49, 54, 24, 10, 55, 25], [24, 45, 15, 46, 46, 16], [4, 152, 122, 18, 153, 123], [13, 74, 46, 32, 75, 47], [48, 54, 24, 14, 55, 25], [42, 45, 15, 32, 46, 16], [20, 147, 117, 4, 148, 118], [40, 75, 47, 7, 76, 48], [43, 54, 24, 22, 55, 25], [10, 45, 15, 67, 46, 16], [19, 148, 118, 6, 149, 119], [18, 75, 47, 31, 76, 48], [34, 54, 24, 34, 55, 25], [20, 45, 15, 61, 46, 16]];\n' +
            '        QRRSBlock.getRSBlocks = function (typeNumber, errorCorrectLevel) {\n' +
            '            let rsBlock = QRRSBlock.getRsBlockTable(typeNumber, errorCorrectLevel);\n' +
            '            if (rsBlock === undefined) {\n' +
            '                throw new Error("bad rs block @ typeNumber:" + typeNumber + "/errorCorrectLevel:" + errorCorrectLevel);\n' +
            '            }\n' +
            '            let length = rsBlock.length / 3;\n' +
            '            let list = [];\n' +
            '            for (let i = 0; i < length; i++) {\n' +
            '                let count = rsBlock[i * 3];\n' +
            '                let totalCount = rsBlock[i * 3 + 1];\n' +
            '                let dataCount = rsBlock[i * 3 + 2];\n' +
            '                for (let j = 0; j < count; j++) {\n' +
            '                    list.push(new QRRSBlock(totalCount, dataCount));\n' +
            '                }\n' +
            '            }\n' +
            '            return list;\n' +
            '        };\n' +
            '        QRRSBlock.getRsBlockTable = function (typeNumber, errorCorrectLevel) {\n' +
            '            switch (errorCorrectLevel) {\n' +
            '                case QRErrorCorrectLevel.L:\n' +
            '                    return QRRSBlock.RS_BLOCK_TABLE[(typeNumber - 1) * 4];\n' +
            '                case QRErrorCorrectLevel.M:\n' +
            '                    return QRRSBlock.RS_BLOCK_TABLE[(typeNumber - 1) * 4 + 1];\n' +
            '                case QRErrorCorrectLevel.Q:\n' +
            '                    return QRRSBlock.RS_BLOCK_TABLE[(typeNumber - 1) * 4 + 2];\n' +
            '                case QRErrorCorrectLevel.H:\n' +
            '                    return QRRSBlock.RS_BLOCK_TABLE[(typeNumber - 1) * 4 + 3];\n' +
            '                default:\n' +
            '                    return undefined;\n' +
            '            }\n' +
            '        };\n' +
            '\n' +
            '        function QRBitBuffer() {\n' +
            '            this.buffer = [];\n' +
            '            this.length = 0;\n' +
            '        }\n' +
            '\n' +
            '        QRBitBuffer.prototype = {\n' +
            '            get: function (index) {\n' +
            '                let bufIndex = Math.floor(index / 8);\n' +
            '                return ((this.buffer[bufIndex] >>> (7 - index % 8)) & 1) === 1;\n' +
            '            }, put: function (num, length) {\n' +
            '                for (let i = 0; i < length; i++) {\n' +
            '                    this.putBit(((num >>> (length - i - 1)) & 1) === 1);\n' +
            '                }\n' +
            '            }, getLengthInBits: function () {\n' +
            '                return this.length;\n' +
            '            }, putBit: function (bit) {\n' +
            '                let bufIndex = Math.floor(this.length / 8);\n' +
            '                if (this.buffer.length <= bufIndex) {\n' +
            '                    this.buffer.push(0);\n' +
            '                }\n' +
            '                if (bit) {\n' +
            '                    this.buffer[bufIndex] |= (0x80 >>> (this.length % 8));\n' +
            '                }\n' +
            '                this.length++;\n' +
            '            }\n' +
            '        };\n' +
            '        let QRCodeLimitLength = [[17, 14, 11, 7], [32, 26, 20, 14], [53, 42, 32, 24], [78, 62, 46, 34], [106, 84, 60, 44], [134, 106, 74, 58], [154, 122, 86, 64], [192, 152, 108, 84], [230, 180, 130, 98], [271, 213, 151, 119], [321, 251, 177, 137], [367, 287, 203, 155], [425, 331, 241, 177], [458, 362, 258, 194], [520, 412, 292, 220], [586, 450, 322, 250], [644, 504, 364, 280], [718, 560, 394, 310], [792, 624, 442, 338], [858, 666, 482, 382], [929, 711, 509, 403], [1003, 779, 565, 439], [1091, 857, 611, 461], [1171, 911, 661, 511], [1273, 997, 715, 535], [1367, 1059, 751, 593], [1465, 1125, 805, 625], [1528, 1190, 868, 658], [1628, 1264, 908, 698], [1732, 1370, 982, 742], [1840, 1452, 1030, 790], [1952, 1538, 1112, 842], [2068, 1628, 1168, 898], [2188, 1722, 1228, 958], [2303, 1809, 1283, 983], [2431, 1911, 1351, 1051], [2563, 1989, 1423, 1093], [2699, 2099, 1499, 1139], [2809, 2213, 1579, 1219], [2953, 2331, 1663, 1273]];\n' +
            '\n' +
            '        function _isSupportCanvas() {\n' +
            '            return typeof CanvasRenderingContext2D !== "undefined";\n' +
            '        }\n' +
            '\n' +
            '        // android 2.x doesn\'t support Data-URI spec\n' +
            '        function _getAndroid() {\n' +
            '            let android = false;\n' +
            '            let sAgent = navigator.userAgent;\n' +
            '\n' +
            '            if (/android/i.test(sAgent)) { // android\n' +
            '                android = true;\n' +
            '                let aMat = sAgent.toString().match(/android ([0-9]\\.[0-9])/i);\n' +
            '\n' +
            '                if (aMat && aMat[1]) {\n' +
            '                    android = parseFloat(aMat[1]);\n' +
            '                }\n' +
            '            }\n' +
            '\n' +
            '            return android;\n' +
            '        }\n' +
            '\n' +
            '        let svgDrawer = (function () {\n' +
            '\n' +
            '            let Drawing = function (el, htOption) {\n' +
            '                this._el = el;\n' +
            '                this._htOption = htOption;\n' +
            '            };\n' +
            '\n' +
            '            Drawing.prototype.draw = function (oQRCode) {\n' +
            '                let _htOption = this._htOption;\n' +
            '                let _el = this._el;\n' +
            '                let nCount = oQRCode.getModuleCount();\n' +
            '                let nWidth = Math.floor(_htOption.width / nCount);\n' +
            '                let nHeight = Math.floor(_htOption.height / nCount);\n' +
            '\n' +
            '                this.clear();\n' +
            '\n' +
            '                function makeSVG(tag, attrs) {\n' +
            '                    let el = document.createElementNS(\'http://www.w3.org/2000/svg\', tag);\n' +
            '                    for (let k in attrs)\n' +
            '                        if (attrs.hasOwnProperty(k)) el.setAttribute(k, attrs[k]);\n' +
            '                    return el;\n' +
            '                }\n' +
            '\n' +
            '                let svg = makeSVG("svg", {\n' +
            '                    \'viewBox\': \'0 0 \' + String(nCount) + " " + String(nCount),\n' +
            '                    \'width\': \'100%\',\n' +
            '                    \'height\': \'100%\',\n' +
            '                    \'fill\': _htOption.colorLight\n' +
            '                });\n' +
            '                svg.setAttributeNS("http://www.w3.org/2000/xmlns/", "xmlns:xlink", "http://www.w3.org/1999/xlink");\n' +
            '                _el.appendChild(svg);\n' +
            '\n' +
            '                svg.appendChild(makeSVG("rect", {\n' +
            '                    "fill": _htOption.colorLight,\n' +
            '                    "width": "100%",\n' +
            '                    "height": "100%"\n' +
            '                }));\n' +
            '                svg.appendChild(makeSVG("rect", {\n' +
            '                    "fill": _htOption.colorDark,\n' +
            '                    "width": "1",\n' +
            '                    "height": "1",\n' +
            '                    "id": "template"\n' +
            '                }));\n' +
            '\n' +
            '                for (let row = 0; row < nCount; row++) {\n' +
            '                    for (let col = 0; col < nCount; col++) {\n' +
            '                        if (oQRCode.isDark(row, col)) {\n' +
            '                            let child = makeSVG("use", {"x": String(col), "y": String(row)});\n' +
            '                            child.setAttributeNS("http://www.w3.org/1999/xlink", "href", "#template");\n' +
            '                            svg.appendChild(child);\n' +
            '                        }\n' +
            '                    }\n' +
            '                }\n' +
            '            };\n' +
            '            Drawing.prototype.clear = function () {\n' +
            '                while (this._el.hasChildNodes())\n' +
            '                    this._el.removeChild(this._el.lastChild);\n' +
            '            };\n' +
            '            return Drawing;\n' +
            '        })();\n' +
            '\n' +
            '        let useSVG = document.documentElement.tagName.toLowerCase() === "svg";\n' +
            '\n' +
            '        // Drawing in DOM by using Table tag\n' +
            '        let Drawing = useSVG ? svgDrawer : !_isSupportCanvas() ? (function () {\n' +
            '            let Drawing = function (el, htOption) {\n' +
            '                this._el = el;\n' +
            '                this._htOption = htOption;\n' +
            '            };\n' +
            '\n' +
            '            /**\n' +
            '             * Draw the QRCode\n' +
            '             *\n' +
            '             * @param {QRCode} oQRCode\n' +
            '             */\n' +
            '            Drawing.prototype.draw = function (oQRCode) {\n' +
            '                let _htOption = this._htOption;\n' +
            '                let _el = this._el;\n' +
            '                let nCount = oQRCode.getModuleCount();\n' +
            '                let nWidth = Math.floor(_htOption.width / nCount);\n' +
            '                let nHeight = Math.floor(_htOption.height / nCount);\n' +
            '                let aHTML = [\'<table style="border:0;border-collapse:collapse;">\'];\n' +
            '\n' +
            '                for (let row = 0; row < nCount; row++) {\n' +
            '                    aHTML.push(\'<tr>\');\n' +
            '\n' +
            '                    for (let col = 0; col < nCount; col++) {\n' +
            '                        aHTML.push(\'<td style="border:0;border-collapse:collapse;padding:0;margin:0;width:\' + nWidth + \'px;height:\' + nHeight + \'px;background-color:\' + (oQRCode.isDark(row, col) ? _htOption.colorDark : _htOption.colorLight) + \';"></td>\');\n' +
            '                    }\n' +
            '\n' +
            '                    aHTML.push(\'</tr>\');\n' +
            '                }\n' +
            '\n' +
            '                aHTML.push(\'</table>\');\n' +
            '                _el.innerHTML = aHTML.join(\'\');\n' +
            '\n' +
            '                // Fix the margin values as real size.\n' +
            '                let elTable = _el.childNodes[0];\n' +
            '                let nLeftMarginTable = (_htOption.width - elTable.offsetWidth) / 2;\n' +
            '                let nTopMarginTable = (_htOption.height - elTable.offsetHeight) / 2;\n' +
            '\n' +
            '                if (nLeftMarginTable > 0 && nTopMarginTable > 0) {\n' +
            '                    elTable.style.margin = nTopMarginTable + "px " + nLeftMarginTable + "px";\n' +
            '                }\n' +
            '            };\n' +
            '\n' +
            '            /**\n' +
            '             * Clear the QRCode\n' +
            '             */\n' +
            '            Drawing.prototype.clear = function () {\n' +
            '                this._el.innerHTML = \'\';\n' +
            '            };\n' +
            '\n' +
            '            return Drawing;\n' +
            '        })() : (function () { // Drawing in Canvas\n' +
            '            function _onMakeImage() {\n' +
            '                this._elImage.src = this._elCanvas.toDataURL("image/png");\n' +
            '                this._elImage.style.display = "block";\n' +
            '                this._elCanvas.style.display = "none";\n' +
            '            }\n' +
            '\n' +
            '            // Android 2.1 bug workaround\n' +
            '            // http://code.google.com/p/android/issues/detail?id=5141\n' +
            '            if (this._android && this._android <= 2.1) {\n' +
            '                let factor = 1 / window.devicePixelRatio;\n' +
            '                let drawImage = CanvasRenderingContext2D.prototype.drawImage;\n' +
            '                CanvasRenderingContext2D.prototype.drawImage = function (image, sx, sy, sw, sh, dx, dy, dw, dh) {\n' +
            '                    if (("nodeName" in image) && /img/i.test(image.nodeName)) {\n' +
            '                        for (let i = arguments.length - 1; i >= 1; i--) {\n' +
            '                            arguments[i] = arguments[i] * factor;\n' +
            '                        }\n' +
            '                    } else if (typeof dw === "undefined") {\n' +
            '                        arguments[1] *= factor;\n' +
            '                        arguments[2] *= factor;\n' +
            '                        arguments[3] *= factor;\n' +
            '                        arguments[4] *= factor;\n' +
            '                    }\n' +
            '\n' +
            '                    drawImage.apply(this, arguments);\n' +
            '                };\n' +
            '            }\n' +
            '\n' +
            '            /**\n' +
            '             * Check whether the user\'s browser supports Data URI or not\n' +
            '             *\n' +
            '             * @private\n' +
            '             * @param {Function} fSuccess Occurs if it supports Data URI\n' +
            '             * @param {Function} fFail Occurs if it doesn\'t support Data URI\n' +
            '             */\n' +
            '            function _safeSetDataURI(fSuccess, fFail) {\n' +
            '                let self = this;\n' +
            '                self._fFail = fFail;\n' +
            '                self._fSuccess = fSuccess;\n' +
            '\n' +
            '                // Check it just once\n' +
            '                if (self._bSupportDataURI === null) {\n' +
            '                    let el = document.createElement("img");\n' +
            '                    let fOnError = function () {\n' +
            '                        self._bSupportDataURI = false;\n' +
            '\n' +
            '                        if (self._fFail) {\n' +
            '                            self._fFail.call(self);\n' +
            '                        }\n' +
            '                    };\n' +
            '                    let fOnSuccess = function () {\n' +
            '                        self._bSupportDataURI = true;\n' +
            '\n' +
            '                        if (self._fSuccess) {\n' +
            '                            self._fSuccess.call(self);\n' +
            '                        }\n' +
            '                    };\n' +
            '\n' +
            '                    el.onabort = fOnError;\n' +
            '                    el.onerror = fOnError;\n' +
            '                    el.onload = fOnSuccess;\n' +
            '                    el.src = "data:image/gif;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO9TXL0Y4OHwAAAABJRU5ErkJggg=="; // the Image contains 1px data.\n' +
            '                    return;\n' +
            '                } else if (self._bSupportDataURI === true && self._fSuccess) {\n' +
            '                    self._fSuccess.call(self);\n' +
            '                } else if (self._bSupportDataURI === false && self._fFail) {\n' +
            '                    self._fFail.call(self);\n' +
            '                }\n' +
            '            };\n' +
            '\n' +
            '            /**\n' +
            '             * Drawing QRCode by using canvas\n' +
            '             *\n' +
            '             * @constructor\n' +
            '             * @param {HTMLElement} el\n' +
            '             * @param {Object} htOption QRCode Options\n' +
            '             */\n' +
            '            let Drawing = function (el, htOption) {\n' +
            '                this._bIsPainted = false;\n' +
            '                this._android = _getAndroid();\n' +
            '\n' +
            '                this._htOption = htOption;\n' +
            '                this._elCanvas = document.createElement("canvas");\n' +
            '                this._elCanvas.width = htOption.width;\n' +
            '                this._elCanvas.height = htOption.height;\n' +
            '                el.appendChild(this._elCanvas);\n' +
            '                this._el = el;\n' +
            '                this._oContext = this._elCanvas.getContext("2d");\n' +
            '                this._bIsPainted = false;\n' +
            '                this._elImage = document.createElement("img");\n' +
            '                this._elImage.alt = "Scan me!";\n' +
            '                this._elImage.style.display = "none";\n' +
            '                this._el.appendChild(this._elImage);\n' +
            '                this._bSupportDataURI = null;\n' +
            '            };\n' +
            '\n' +
            '            /**\n' +
            '             * Draw the QRCode\n' +
            '             *\n' +
            '             * @param {QRCode} oQRCode\n' +
            '             */\n' +
            '            Drawing.prototype.draw = function (oQRCode) {\n' +
            '                let _elImage = this._elImage;\n' +
            '                let _oContext = this._oContext;\n' +
            '                let _htOption = this._htOption;\n' +
            '\n' +
            '                let nCount = oQRCode.getModuleCount();\n' +
            '                let nWidth = _htOption.width / nCount;\n' +
            '                let nHeight = _htOption.height / nCount;\n' +
            '                let nRoundedWidth = Math.round(nWidth);\n' +
            '                let nRoundedHeight = Math.round(nHeight);\n' +
            '\n' +
            '                _elImage.style.display = "none";\n' +
            '                this.clear();\n' +
            '\n' +
            '                for (let row = 0; row < nCount; row++) {\n' +
            '                    for (let col = 0; col < nCount; col++) {\n' +
            '                        let bIsDark = oQRCode.isDark(row, col);\n' +
            '                        let nLeft = col * nWidth;\n' +
            '                        let nTop = row * nHeight;\n' +
            '                        _oContext.strokeStyle = bIsDark ? _htOption.colorDark : _htOption.colorLight;\n' +
            '                        _oContext.lineWidth = 1;\n' +
            '                        _oContext.fillStyle = bIsDark ? _htOption.colorDark : _htOption.colorLight;\n' +
            '                        _oContext.fillRect(nLeft, nTop, nWidth, nHeight);\n' +
            '\n' +
            '                        // 안티 앨리어싱 방지 처리\n' +
            '                        _oContext.strokeRect(\n' +
            '                            Math.floor(nLeft) + 0.5,\n' +
            '                            Math.floor(nTop) + 0.5,\n' +
            '                            nRoundedWidth,\n' +
            '                            nRoundedHeight\n' +
            '                        );\n' +
            '\n' +
            '                        _oContext.strokeRect(\n' +
            '                            Math.ceil(nLeft) - 0.5,\n' +
            '                            Math.ceil(nTop) - 0.5,\n' +
            '                            nRoundedWidth,\n' +
            '                            nRoundedHeight\n' +
            '                        );\n' +
            '                    }\n' +
            '                }\n' +
            '\n' +
            '                this._bIsPainted = true;\n' +
            '            };\n' +
            '\n' +
            '            /**\n' +
            '             * Make the image from Canvas if the browser supports Data URI.\n' +
            '             */\n' +
            '            Drawing.prototype.makeImage = function () {\n' +
            '                if (this._bIsPainted) {\n' +
            '                    _safeSetDataURI.call(this, _onMakeImage);\n' +
            '                }\n' +
            '            };\n' +
            '\n' +
            '            /**\n' +
            '             * Return whether the QRCode is painted or not\n' +
            '             *\n' +
            '             * @return {Boolean}\n' +
            '             */\n' +
            '            Drawing.prototype.isPainted = function () {\n' +
            '                return this._bIsPainted;\n' +
            '            };\n' +
            '\n' +
            '            /**\n' +
            '             * Clear the QRCode\n' +
            '             */\n' +
            '            Drawing.prototype.clear = function () {\n' +
            '                this._oContext.clearRect(0, 0, this._elCanvas.width, this._elCanvas.height);\n' +
            '                this._bIsPainted = false;\n' +
            '            };\n' +
            '\n' +
            '            /**\n' +
            '             * @private\n' +
            '             * @param {Number} nNumber\n' +
            '             */\n' +
            '            Drawing.prototype.round = function (nNumber) {\n' +
            '                if (!nNumber) {\n' +
            '                    return nNumber;\n' +
            '                }\n' +
            '\n' +
            '                return Math.floor(nNumber * 1000) / 1000;\n' +
            '            };\n' +
            '\n' +
            '            return Drawing;\n' +
            '        })();\n' +
            '\n' +
            '        /**\n' +
            '         * Get the type by string length\n' +
            '         *\n' +
            '         * @private\n' +
            '         * @param {String} sText\n' +
            '         * @param {Number} nCorrectLevel\n' +
            '         * @return {Number} type\n' +
            '         */\n' +
            '        function _getTypeNumber(sText, nCorrectLevel) {\n' +
            '            let nType = 1;\n' +
            '            let length = _getUTF8Length(sText);\n' +
            '\n' +
            '            for (let i = 0, len = QRCodeLimitLength.length; i <= len; i++) {\n' +
            '                let nLimit = 0;\n' +
            '\n' +
            '                switch (nCorrectLevel) {\n' +
            '                    case QRErrorCorrectLevel.L :\n' +
            '                        nLimit = QRCodeLimitLength[i][0];\n' +
            '                        break;\n' +
            '                    case QRErrorCorrectLevel.M :\n' +
            '                        nLimit = QRCodeLimitLength[i][1];\n' +
            '                        break;\n' +
            '                    case QRErrorCorrectLevel.Q :\n' +
            '                        nLimit = QRCodeLimitLength[i][2];\n' +
            '                        break;\n' +
            '                    case QRErrorCorrectLevel.H :\n' +
            '                        nLimit = QRCodeLimitLength[i][3];\n' +
            '                        break;\n' +
            '                }\n' +
            '\n' +
            '                if (length <= nLimit) {\n' +
            '                    break;\n' +
            '                } else {\n' +
            '                    nType++;\n' +
            '                }\n' +
            '            }\n' +
            '\n' +
            '            if (nType > QRCodeLimitLength.length) {\n' +
            '                throw new Error("Too long data");\n' +
            '            }\n' +
            '\n' +
            '            return nType;\n' +
            '        }\n' +
            '\n' +
            '        function _getUTF8Length(sText) {\n' +
            '            let replacedText = encodeURI(sText).toString().replace(/\\%[0-9a-fA-F]{2}/g, \'a\');\n' +
            '            return replacedText.length + (replacedText.length !== sText ? 3 : 0);\n' +
            '        }\n' +
            '\n' +
            '        /**\n' +
            '         * @class QRCode\n' +
            '         * @constructor\n' +
            '         * @example\n' +
            '         * new QRCode(document.getElementById("test"), "http://jindo.dev.naver.com/collie");\n' +
            '         *\n' +
            '         * @example\n' +
            '         * let oQRCode = new QRCode("test", {\n' +
            '\t *    text : "http://naver.com",\n' +
            '\t *    width : 128,\n' +
            '\t *    height : 128\n' +
            '\t * });\n' +
            '         *\n' +
            '         * oQRCode.clear(); // Clear the QRCode.\n' +
            '         * oQRCode.makeCode("http://map.naver.com"); // Re-create the QRCode.\n' +
            '         *\n' +
            '         * @param {HTMLElement|String} el target element or \'id\' attribute of element.\n' +
            '         * @param {Object|String} vOption\n' +
            '         * @param {String} vOption.text QRCode link data\n' +
            '         * @param {Number} [vOption.width=256]\n' +
            '         * @param {Number} [vOption.height=256]\n' +
            '         * @param {String} [vOption.colorDark="#000000"]\n' +
            '         * @param {String} [vOption.colorLight="#ffffff"]\n' +
            '         * @param {QRCode.CorrectLevel} [vOption.correctLevel=QRCode.CorrectLevel.H] [L|M|Q|H]\n' +
            '         */\n' +
            '        QRCode = function (el, vOption) {\n' +
            '            this._htOption = {\n' +
            '                width: 256,\n' +
            '                height: 256,\n' +
            '                typeNumber: 4,\n' +
            '                colorDark: "#000000",\n' +
            '                colorLight: "#ffffff",\n' +
            '                correctLevel: QRErrorCorrectLevel.H\n' +
            '            };\n' +
            '\n' +
            '            if (typeof vOption === \'string\') {\n' +
            '                vOption = {\n' +
            '                    text: vOption\n' +
            '                };\n' +
            '            }\n' +
            '\n' +
            '            // Overwrites options\n' +
            '            if (vOption) {\n' +
            '                for (let i in vOption) {\n' +
            '                    this._htOption[i] = vOption[i];\n' +
            '                }\n' +
            '            }\n' +
            '\n' +
            '            if (typeof el === "string") {\n' +
            '                el = document.getElementById(el);\n' +
            '            }\n' +
            '\n' +
            '            if (this._htOption.useSVG) {\n' +
            '                Drawing = svgDrawer;\n' +
            '            }\n' +
            '\n' +
            '            this._android = _getAndroid();\n' +
            '            this._el = el;\n' +
            '            this._oQRCode = null;\n' +
            '            this._oDrawing = new Drawing(this._el, this._htOption);\n' +
            '\n' +
            '            if (this._htOption.text) {\n' +
            '                this.makeCode(this._htOption.text);\n' +
            '            }\n' +
            '        };\n' +
            '\n' +
            '        /**\n' +
            '         * Make the QRCode\n' +
            '         *\n' +
            '         * @param {String} sText link data\n' +
            '         */\n' +
            '        QRCode.prototype.makeCode = function (sText) {\n' +
            '            this._oQRCode = new QRCodeModel(_getTypeNumber(sText, this._htOption.correctLevel), this._htOption.correctLevel);\n' +
            '            this._oQRCode.addData(sText);\n' +
            '            this._oQRCode.make();\n' +
            '            this._el.title = sText;\n' +
            '            this._oDrawing.draw(this._oQRCode);\n' +
            '            this.makeImage();\n' +
            '        };\n' +
            '\n' +
            '        /**\n' +
            '         * Make the Image from Canvas element\n' +
            '         * - It occurs automatically\n' +
            '         * - Android below 3 doesn\'t support Data-URI spec.\n' +
            '         *\n' +
            '         * @private\n' +
            '         */\n' +
            '        QRCode.prototype.makeImage = function () {\n' +
            '            if (typeof this._oDrawing.makeImage === "function" && (!this._android || this._android >= 3)) {\n' +
            '                this._oDrawing.makeImage();\n' +
            '            }\n' +
            '        };\n' +
            '\n' +
            '        /**\n' +
            '         * Clear the QRCode\n' +
            '         */\n' +
            '        QRCode.prototype.clear = function () {\n' +
            '            this._oDrawing.clear();\n' +
            '        };\n' +
            '\n' +
            '        /**\n' +
            '         * @name QRCode.CorrectLevel\n' +
            '         */\n' +
            '        QRCode.CorrectLevel = QRErrorCorrectLevel;\n' +
            '    })();\n' +
            '\n' +
            '    /**\n' +
            '     * 获取URL参数内容\n' +
            '     * @return {string}\n' +
            '     */\n' +
            '    function getQueryString(name) {\n' +
            '        let reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");\n' +
            '        let r = window.location.search.substr(1).match(reg);\n' +
            '        if (r !== null) return unescape(r[2]);\n' +
            '        return null;\n' +
            '    }\n' +
            '\n' +
            '    /**\n' +
            '     * 生成二维码\n' +
            '     * @param qrcodeValue\n' +
            '     * @param qrcodeWidth\n' +
            '     * @param qrcodeHeight\n' +
            '     */\n' +
            '    function generQrcode(qrcodeValue, qrcodeWidth, qrcodeHeight) {\n' +
            '        return new QRCode(document.getElementById("qrcode"), {\n' +
            '            text: qrcodeValue ? qrcodeValue : "",\n' +
            '            width: qrcodeWidth ? qrcodeWidth : 128,\n' +
            '            height: qrcodeHeight ? qrcodeHeight : 128,\n' +
            '            colorDark: "#000000",\n' +
            '            colorLight: "#ffffff",\n' +
            '            correctLevel: QRCode.CorrectLevel.H\n' +
            '        });\n' +
            '    }\n' +
            '\n' +
            '\n' +
            '    let qrcode = generQrcode(\n' +
            '        '+'"'+meQrcodeValue+'"'+',\n' +
            '        '+meQrcodeWidth+',\n' +
            '        '+meQrcodeHeight+'\n' +
            '    );\n' +
            '</script>\n' +
            '</body>\n' +
            '</html>');
    };
}