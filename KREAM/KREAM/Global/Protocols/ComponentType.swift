//
//  ComponentType.swift
//  KREAM
//
//  Created by 박민서 on 5/21/24.
//

/// 컴포넌트의 Input / Output 정의, 교환을 위한 protocol입니다.
/// - Input : 준수 클래스 기준, 들어오는 데이터 (수입)
/// - Output: 준수 클래스 기준, 나가는 데이터 (수출)
/// - interface(): 준수 클래스 기준, Input Output 교환 로직 (무역)
protocol ComponentType {
    
    associatedtype Input
    associatedtype Output
    
    func interface(input: Input) -> Output
}
