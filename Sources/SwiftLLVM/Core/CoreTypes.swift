//
//  CoreTypes.swift
//  
//
//  Created by David Green on 3/2/23.
//

import cllvm

public enum Opcode: CaseIterable {
    // Terminator Instructions
    case ret
    case br
    case `switch`
    case indirectBr
    case invoke
    case unreachable
    case callBr
    
    // Standard Unary Operators
    case fNeg
    
    // Standard Binary Operators
    case add
    case fAdd
    case sub
    case fSub
    case mul
    case fMul
    case uDiv
    case sDiv
    case fDiv
    case uRem
    case sRem
    case fRem
    
    // Logical Operators
    case shl
    case lShr
    case aShr
    case and
    case or
    case xor
    
    // Memory Operators
    case alloca
    case load
    case store
    case getElementPointer
    
    // Cast Operators
    case trunc
    case zExt
    case sExt
    case fpToUI
    case fpToSI
    case uiToFP
    case siToFP
    case fpTrunc
    case fpExt
    case ptrToInt
    case intToPtr
    case bitCast
    case AddressSpaceCast
    
    // Other Operators
    case iCmp
    case fCmp
    case PHI
    case call
    case select
    case userOp1
    case userOp2
    case vaArg
    case extractElement
    case insertElement
    case shuffleVector
    case extractValue
    case insertValue
    case freeze
    
    // Atomic Operators
    case fence
    case atomicCmpXchg
    case atomicRMW
    
    // Exception Handling Operators
    case resume
    case landingPad
    case cleanupRet
    case catchRet
    case catchPad
    case cleanupPad
    case catchSwitch
    
    /// Creates an `Opcode` from an `LLVMOpcode`
    init(rawValue: LLVMOpcode) {
        switch rawValue {
        case LLVMRet: self = .ret
        case LLVMBr: self = .br
        case LLVMSwitch: self = .switch
        case LLVMIndirectBr: self = .indirectBr
        case LLVMInvoke: self = .invoke
        case LLVMUnreachable: self = .unreachable
        case LLVMCallBr: self = .callBr
        case LLVMFNeg: self = .fNeg
        case LLVMAdd: self = .add
        case LLVMFAdd: self = .fAdd
        case LLVMSub: self = .sub
        case LLVMFSub: self = .fSub
        case LLVMMul: self = .mul
        case LLVMFMul: self = .fMul
        case LLVMUDiv: self = .uDiv
        case LLVMSDiv: self = .sDiv
        case LLVMFDiv: self = .fDiv
        case LLVMURem: self = .uRem
        case LLVMSRem: self = .sRem
        case LLVMFRem: self = .fRem
        case LLVMShl: self = .shl
        case LLVMLShr: self = .lShr
        case LLVMAShr: self = .aShr
        case LLVMAnd: self = .and
        case LLVMOr: self = .or
        case LLVMXor: self = .xor
        case LLVMAlloca: self = .alloca
        case LLVMLoad: self = .load
        case LLVMStore: self = .store
        case LLVMGetElementPtr: self = .getElementPointer
        case LLVMTrunc: self = .trunc
        case LLVMZExt: self = .zExt
        case LLVMSExt: self = .sExt
        case LLVMFPToUI: self = .fpToUI
        case LLVMFPToSI: self = .fpToSI
        case LLVMUIToFP: self = .uiToFP
        case LLVMSIToFP: self = .siToFP
        case LLVMFPTrunc: self = .fpTrunc
        case LLVMFPExt: self = .fpExt
        case LLVMPtrToInt: self = .ptrToInt
        case LLVMIntToPtr: self = .intToPtr
        case LLVMBitCast: self = .bitCast
        case LLVMAddrSpaceCast: self = .AddressSpaceCast
        case LLVMICmp: self = .iCmp
        case LLVMFCmp: self = .fCmp
        case LLVMPHI: self = .PHI
        case LLVMCall: self = .call
        case LLVMSelect: self = .select
        case LLVMUserOp1: self = .userOp1
        case LLVMUserOp2: self = .userOp2
        case LLVMVAArg: self = .vaArg
        case LLVMExtractElement: self = .extractElement
        case LLVMInsertElement: self = .insertElement
        case LLVMShuffleVector: self = .shuffleVector
        case LLVMExtractValue: self = .extractValue
        case LLVMInsertValue: self = .insertValue
        case LLVMFreeze: self = .freeze
        case LLVMFence: self = .fence
        case LLVMAtomicCmpXchg: self = .atomicCmpXchg
        case LLVMAtomicRMW: self = .atomicRMW
        case LLVMResume: self = .resume
        case LLVMLandingPad: self = .landingPad
        case LLVMCleanupRet: self = .cleanupRet
        case LLVMCatchRet: self = .catchRet
        case LLVMCatchPad: self = .catchPad
        case LLVMCatchSwitch: self = .catchSwitch
        case LLVMCleanupPad: self = .cleanupPad
        default:
            fatalError("Invalid LLVMOpcode \(rawValue)")
        }
    }
    
    static let operationMap: [Opcode: LLVMOpcode] = [
        .ret: LLVMRet,
        .br: LLVMBr,
        .switch: LLVMSwitch,
        .indirectBr: LLVMIndirectBr,
        .invoke: LLVMInvoke,
        .unreachable: LLVMUnreachable,
        .callBr: LLVMCallBr,
        .fNeg: LLVMFNeg,
        .add: LLVMAdd,
        .fAdd: LLVMFAdd,
        .sub: LLVMSub,
        .fSub: LLVMFSub,
        .mul: LLVMMul,
        .fMul: LLVMFMul,
        .uDiv: LLVMUDiv,
        .sDiv: LLVMSDiv,
        .fDiv: LLVMFDiv,
        .uRem: LLVMURem,
        .sRem: LLVMSRem,
        .fRem: LLVMFRem,
        .shl: LLVMShl,
        .lShr: LLVMLShr,
        .aShr: LLVMAShr,
        .and: LLVMAnd,
        .or: LLVMOr,
        .xor: LLVMXor,
        .alloca: LLVMAlloca,
        .load: LLVMLoad,
        .store: LLVMStore,
        .getElementPointer: LLVMGetElementPtr,
        .trunc: LLVMTrunc,
        .zExt: LLVMZExt,
        .sExt: LLVMSExt,
        .fpToUI: LLVMFPToUI,
        .fpToSI: LLVMFPToSI,
        .uiToFP: LLVMUIToFP,
        .siToFP: LLVMSIToFP,
        .fpTrunc: LLVMFPTrunc,
        .fpExt: LLVMFPExt,
        .ptrToInt: LLVMPtrToInt,
        .intToPtr: LLVMIntToPtr,
        .bitCast: LLVMBitCast,
        .AddressSpaceCast: LLVMAddrSpaceCast,
        .iCmp: LLVMICmp,
        .fCmp: LLVMFCmp,
        .PHI: LLVMPHI,
        .call: LLVMCall,
        .select: LLVMSelect,
        .userOp1: LLVMUserOp1,
        .userOp2: LLVMUserOp2,
        .vaArg: LLVMVAArg,
        .extractElement: LLVMExtractElement,
        .insertElement: LLVMInsertElement,
        .shuffleVector: LLVMShuffleVector,
        .extractValue: LLVMExtractValue,
        .insertValue: LLVMInsertValue,
        .freeze: LLVMFreeze,
        .fence: LLVMFence,
        .atomicCmpXchg: LLVMAtomicCmpXchg,
        .atomicRMW: LLVMAtomicRMW,
        .resume: LLVMResume,
        .landingPad: LLVMLandingPad,
        .cleanupRet: LLVMCleanupRet,
        .catchRet: LLVMCatchRet,
        .catchPad: LLVMCatchPad,
        .catchSwitch: LLVMCatchSwitch,
        .cleanupPad: LLVMCleanupPad,
    ]
    
    public var llvm: LLVMOpcode {
        return Opcode.operationMap[self]!
    }
}


